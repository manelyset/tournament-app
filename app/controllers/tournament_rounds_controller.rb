# frozen_string_literal: true

class TournamentRoundsController < ApplicationController
  def index
    @presenter = TournamentRounds::IndexPresenter.new
  end

  def create
    if %w[A B].include?(params[:division])
      DivisionResultsGeneratorService.call(division: params[:division])
    elsif params[:division] == 'playoff'
      PlayoffResultsGeneratorService.call
    end

    redirect_to tournament_rounds_path
  end
end
