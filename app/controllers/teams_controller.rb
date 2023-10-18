# frozen_string_literal: true

class TeamsController < ApplicationController
  def index; end

  def create
    Team.destroy_all
    Teams::CreatorService.call(params[:teams_list])

    redirect_to tournament_rounds_path
  end
end
