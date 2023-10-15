# frozen_string_literal: true

module Teams
  class ListGeneratorService
    NUMBER_OF_TEAMS = 16

    class << self
      def call(teams_list)
        team_names_array = teams_list.split('\r\n').first(NUMBER_OF_TEAMS)
        fill_missing(team_names_array) if team_names_array.length < NUMBER_OF_TEAMS
        team_names_array
      end

      private

      def fill_missing(team_names_array)
        index = team_names_array.length + 1

        while index <= NUMBER_OF_TEAMS
          team_names_array << "Team #{index}"
          index += 1
        end

        team_names_array
      end
    end
  end
end
