# frozen_string_literal: true

class TournamentRoundsController < ApplicationController
  def index
    @division_a_teams = TournamentRound.division_a
    @division_b_teams = TournamentRound.division_b
    @playoff_teams = TournamentRound.playoff_teams
    @winner = TournamentRound.find_by(round: 4, round_winner: true)
  end

  def create
    redirect_to tournament_rounds_path
  end
end
