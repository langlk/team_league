class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table(:games) do |t|
      t.column(:home_team_id, :int)
      t.column(:away_team_id, :int)
      t.column(:home_team_score, :int)
      t.column(:away_team_score, :int)
      t.timestamps
    end
  end
end
