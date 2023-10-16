# frozen_string_literal: true

module TournamentRounds
  class DivisionResultsGeneratorService
    class << self
      def call(division:)
        return if TournamentRound.where(division: division).playoff_teams.count == 2

        (TournamentRound::PLAYOFF_ROUND - 1).times do |round|
          round_results(round, division)
        end
      end

      private

      def round_results(round, division)
        TournamentRound.where(round: round).order(:row).each_cons(2) do |team1, team2|
          team1.update(round_score: Random.new.rand(100))
          team2.update(round_score: Random.new.rand(100))

          choose_winner(team1, team2, division)
        end
      end

      def choose_winner(team1, team2, division)
        winning_team = [team1, team2].max_by(&:round_score)
        new_row = (winning_team.row / 2) + (winning_team.row % 2)

        TournamentRound.create(round: round + 1, row: new_row, division: division, team: winning_team.team)
      end
    end
  end
end
