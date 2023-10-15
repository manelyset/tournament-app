# frozen_string_literal: true

module Teams
  class CreatorService
    TEAMS_IN_DIVISION = Teams::ListGeneratorService::NUMBER_OF_TEAMS / 2

    class << self
      def call(teams_list)
        team_names_array = Teams::ListGeneratorService.call(teams_list).shuffle

        generate_teams(team_names_array.first(TEAMS_IN_DIVISION), division: 'A')
        generate_teams(team_names_array.last(TEAMS_IN_DIVISION), division: 'B')
      end

      private

      def generate_teams(team_names_array, division:)
        row_count = 1
        team_names_array.each do |name|
          team = Team.create(name: name)
          TournamentRound.create(team: team, round: 1, row: row_count, division: division)
          row_count += 1
        end
      end
    end
  end
end
