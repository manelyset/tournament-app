class CreateTournamentRounds < ActiveRecord::Migration[7.1]
  def change
    create_table :tournament_rounds do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :round
      t.integer :row
      t.column :division, :division_enum
      t.integer :round_score

      t.timestamps
    end
  end
end
