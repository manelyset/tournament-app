# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TournamentRoundsController do
  describe '#index' do
    before { get :index }

    it 'returns status 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    before do
      allow(TournamentRounds::DivisionResultsGeneratorService).to receive(:call).and_return('')
      post :create, params: { division: 'A' }
    end

    it 'calls service by params and redirects to index page', :aggregate_failures do
      expect(TournamentRounds::DivisionResultsGeneratorService).to have_received(:call).with(division: 'A')
      expect(response).to have_http_status(:found)
    end
  end
end
