class CreateTeams < ActiveRecord::Migration[7.1]
  def up
    execute <<~SQL
      CREATE TYPE division_enum AS ENUM ('A', 'B');
    SQL

    create_table :teams do |t|
      t.string :name
      t.string :division
      t.boolean :round_winner, default: true

      t.timestamps
    end
  end

  def down
    drop_table :teams

    execute <<~SQL
      DROP TYPE division_enum;
    SQL
  end
end
