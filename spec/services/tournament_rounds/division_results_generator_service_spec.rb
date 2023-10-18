# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TournamentRounds::DivisionResultsGeneratorService do
  describe '.call' do
    subject(:call) { described_class.call(division: 'A') }

    context 'when correct amount of teams' do
      before do
        (1..8).map do |row|
          create(:tournament_round, round: 1, row: row, division: 'A')
        end
      end

      it 'creates new rounds, fills scores and chooses winners', :aggregate_failures do
        call

        expect(TournamentRound.count).to eq(14)
        expect(TournamentRound.where(round: 2).pluck(:round_score).all?).to be true
        expect(TournamentRound.where(round: 3).pluck(:round_score).any?).to be false

        round1 = TournamentRound.find_by(round: 2, row: 1)
        round2 = TournamentRound.find_by(round: 2, row: 2)
        team = [round1, round2].max_by(&:round_score).team
        expect(TournamentRound.find_by(round: 3, row: 1).team).to eq(team)
      end
    end

    context 'when division results already exist' do
      before do
        create_list(:tournament_round, 2, round: 3, division: 'A')
      end

      it 'does not play new games' do
        expect { call }.not_to(change(TournamentRound, :count))
      end
    end
  end
end
