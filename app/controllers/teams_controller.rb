# frozen_string_literal: true

class TeamsController < ApplicationController
  def index; end

  def create
    TeamsCreatorService.call(params[:teams_list])

    redirect_to tours_path
  end
end
