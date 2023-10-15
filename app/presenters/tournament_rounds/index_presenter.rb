# frozen_string_literal: true

module TournamentRounds
  class IndexPresenter
    def initialize
      @playoff_teams = TournamentRound.playoff_teams
      @winner = TournamentRound.find_by(round: 4, round_winner: true)
    end

    attr_reader :winner

    def round_result(division:, round:, row:)
      tournament_round_item = TournamentRound.find_by(division: division, round: round, row: row)

      result_string = tournament_round_item&.team&.name
      result_string += " (#{tournament_round_item&.round_score})" if tournament_round_item&.round_score.present?
      result_string
    end

    def draw_buttons
      if @winner.present?
        button_to 'New tournament', root_path
      elsif @playoff_teams.count == 4
        button_to 'Playoff results', { controller: 'tournament_rounds', action: 'create', division: 'playoff' }
      else
        button_to 'Division A results', { controller: 'tournament_rounds', action: 'create', division: 'A' }
        button_to 'Division B results', { controller: 'tournament_rounds', action: 'create', division: 'B' }
      end
    end
  end
end
