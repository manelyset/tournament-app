# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, presence: true

  scope :division_a, -> { where(division: 'A') }
  scope :division_b, -> { where(division: 'B') }
end
