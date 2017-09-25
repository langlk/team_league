require "spec_helper"

describe('Game') do
  describe('#home_team') do
    it "connects to one home team" do
      team1 = Team.create({name: 'TSM', coach: 'Bob'})
      team2 = Team.create({name: 'CLG', coach: 'Fred'})
      game1 = Game.create({home_team_id: team1.id, away_team_id: team2.id})
      expect(game1.home_team).to eq(team1)
    end
  end

  describe('#away_team') do
    it "connects to one away team" do
      team1 = Team.create({name: 'TSM', coach: 'Bob'})
      team2 = Team.create({name: 'CLG', coach: 'Fred'})
      game1 = Game.create({home_team_id: team1.id, away_team_id: team2.id})
      expect(game1.away_team).to eq(team2)
    end
  end
end
