# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Teams::ListGeneratorService do
  describe '.call' do
    subject(:result) { described_class.call(teams_list) }

    context 'when there is less than 16 teams in the list' do
      let(:teams_list) { 't1\r\nt2' }

      it 'fills missing teams with standard names', :aggregate_failures do
        expect(result.first).to eq('t1')
        expect(result.last).to eq('Team 16')
        expect(result.length).to eq(16)
      end
    end

    context 'when there is more than 16 teams' do
      let(:teams_list) { '1\r\n\2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17' }

      it 'only uses first 16 names', :aggregate_failures do
        expect(result).not_to include('17')
        expect(result.length).to eq 16
      end
    end
  end
end
