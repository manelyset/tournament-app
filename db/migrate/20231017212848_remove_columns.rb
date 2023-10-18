class RemoveColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :teams, :division
    remove_column :teams, :round_winner
  end
end
