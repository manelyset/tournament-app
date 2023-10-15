# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Teams::CreatorService do
  describe '.call' do
    subject(:call) { described_class.call('') }

    before do
      teams_array = Array.new(16) { |index| "Team #{index}" }
      allow(Teams::ListGeneratorService).to receive(:call).and_return(teams_array)
      call
    end

    it 'creates a list and splits it to divisions', :aggregate_failures do
      expect(Team.count).to eq(16)
      expect(Team.division_a.count).to eq(8)
      expect(Team.division_b.count).to eq(8)
      expect(Team.pluck(:round_winner).all?).to be true
    end
  end
end
