class CreateTeamsAndPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table(:players) do |t|
      t.column(:name, :string)
      t.column(:team_id, :int)

      t.timestamps
    end

    create_table(:teams) do |t|
      t.column(:name, :string)
      t.column(:coach, :string)

      t.timestamps
    end
  end
end
