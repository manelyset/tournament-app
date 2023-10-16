# frozen_string_literal: true

class TournamentRound < ApplicationRecord
  PLAYOFF_ROUND = 3
  PLAYOFF_TEAMS_COUNT = 4

  belongs_to :team

  validates :round, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
  validates :row, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8 }
  validates :round_score, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }, allow_nil: true

  scope :division_a, -> { where(division: 'A') }
  scope :division_b, -> { where(division: 'B') }
  scope :playoff_teams, -> { where(round: 3) }
end
