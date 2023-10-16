# frozen_string_literal: true

module TournamentRounds
  class DivisionResultsGeneratorService
    class << self
      def call
        playoff_teams = TournamentRound.playoff_teams
        return unless playoff_teams.count == TournamentRound::PLAYOFF_TEAMS_COUNT

        worst_team, best_team = playoff_teams.minmax_by do |item|
          TournamentRound.find_by(team: item.team, round: TournamentRound::PLAYOFF_ROUND - 1).round_score
        end

        team1, team2 = playoff_teams.where.not(id: [worst_team, best_team].ids)

        winner1 = choose_winner(worst_team, best_team)
        winner2 = choose_winner(team1, team2)

        choose_winner(winner1, winner2)
      end

      private

      def choose_winner(team1, team2)
        team1.update(round_score: Random.new.rand(100))
        team2.update(round_score: Random.new.rand(100))

        winning_team = [team1, team2].max_by(&:round_score)

        TournamentRound.create(round: winning_team.round + 1, team: winning_team.team)
      end
    end
  end
end
