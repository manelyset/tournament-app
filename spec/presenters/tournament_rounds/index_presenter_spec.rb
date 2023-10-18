# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TournamentRounds::IndexPresenter do
  describe '#round_result' do
    subject(:result_string) { described_class.new.round_result(options) }

    let(:team) { create(:team, name: 'TeamName') }
    let(:tournament_round) { create(:tournament_round, team: team, division: 'A', round: 2, row: 3) }
    let(:options) { { division: 'A', round: 2, row: 3 } }

    before do
      tournament_round
    end

    context 'when no round score' do
      it 'retruns team name' do
        expect(result_string).to eq('TeamName')
      end
    end

    context 'when score is present' do
      let(:tournament_round) { create(:tournament_round, team: team, division: 'A', round: 2, row: 3, round_score: 25) }

      it 'returns team name with score' do
        expect(result_string).to eq('TeamName (25)')
      end
    end
  end
end
