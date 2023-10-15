# frozen_string_literal: true

class TournamentRoundsController < ApplicationController
  def index
    @division_a_teams = TounamentRound.division_a
    @division_b_teams = TounamentRound.division_b
    @playoff_teams = TournamentRound.playoff_teams
    @winner = TournamentRound.find_by(round: 4, round_winner: true)
  end
end
