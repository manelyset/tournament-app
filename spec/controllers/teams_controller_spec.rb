# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeamsController do
  describe '#index' do
    before { get :index }

    it 'returns status 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    before do
      allow(Teams::CreatorService).to receive(:call).and_return('')
      post :create, params: { teams_list: 't1\r\nt2' }
    end

    it 'calls service and redirects to tournament page', :aggregate_failures do
      expect(Teams::CreatorService).to have_received(:call).with('t1\r\nt2')
      expect(response).to have_http_status(:found)
    end
  end
end
