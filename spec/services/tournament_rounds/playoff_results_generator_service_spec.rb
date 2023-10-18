# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TournamentRounds::PlayoffResultsGeneratorService do
  describe '.call' do
    subject(:call) { described_class.call }

    context 'when correct amount of teams' do
      before do
        4.times do |n|
          team = create(:team, name: "Team #{n + 1}")
          create(:tournament_round, round: 2, team: team, round_score: n + 1)
          create(:tournament_round, round: 3, team: team)
        end
      end

      it 'matches teams correctly and chooses a winner', :aggregate_failures do
        call

        expect(TournamentRound.find_by(round: 4, row: 1).team.name).not_to eq('Team 2')
        expect(TournamentRound.find_by(round: 4, row: 1).team.name).not_to eq('Team 3')
        expect(TournamentRound.find_by(round: 4, row: 2).team.name).not_to eq('Team 1')
        expect(TournamentRound.find_by(round: 4, row: 2).team.name).not_to eq('Team 4')
        expect(TournamentRound.where(round: 5).count).to eq(1)
      end
    end

    context 'when division results already exist' do
      it 'does not play new games' do
        expect { call }.not_to(change(TournamentRound, :count))
      end
    end
  end
end
