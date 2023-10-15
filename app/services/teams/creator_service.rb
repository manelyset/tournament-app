# frozen_string_literal: true

module Teams
  class CreatorService
    TEAMS_IN_DIVISION = Teams::ListGeneratorService::NUMBER_OF_TEAMS / 2

    class << self
      def call(teams_list)
        team_names_array = Teams::ListGeneratorService.call(teams_list).shuffle

        team_names_array.first(TEAMS_IN_DIVISION).each do |name|
          Team.create(name: name, division: 'A', round_winner: true)
        end

        team_names_array.last(TEAMS_IN_DIVISION).each do |name|
          Team.create(name: name, division: 'B', round_winner: true)
        end
      end
    end
  end
end
