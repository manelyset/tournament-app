# frozen_string_literal: true

FactoryBot.define do
  factory :tournament_round do
    team
    division { 'A' }
    round { 1 }
    row { 1 }
  end
end
