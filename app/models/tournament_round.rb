# frozen_string_literal: true

class TournamentRound < ApplicationRecord
  belongs_to :team

  validates :round, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
  validates :row, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8 }
end
