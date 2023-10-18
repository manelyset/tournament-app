# frozen_string_literal: true

module TournamentRounds
  class IndexPresenter
    def initialize
      @playoff_teams = TournamentRound.playoff_teams
      @winner = TournamentRound.find_by(round: 5)
    end

    attr_reader :winner, :playoff_teams

    def round_result(options)
      tournament_round_item = TournamentRound.find_by(**options)

      result_string = tournament_round_item&.team&.name
      result_string += " (#{tournament_round_item&.round_score})" if tournament_round_item&.round_score.present?
      result_string
    end
  end
end
