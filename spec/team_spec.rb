#!/usr/bin/env ruby

require 'rspec'
require 'team'

describe('Team') do
  describe '#players' do
    it "returns all players assigned to the team" do
      team = Team.new({name: "CLG"})
      player1 = Player.new({name: "DoubleLift", team_id: team.id})
      player2 = Player.new({name: "Aphromoo", team_id: team.id})
    end
  end

  describe '#home_games' do
    it "returns all home games scheduled for a team" do
      team1 = Team.create({name: 'TSM', coach: 'Bob'})
      team2 = Team.create({name: 'CLG', coach: 'Bob'})
      game = Game.create({home_team_id: team1.id, away_team_id: team2.id})
      expect(team1.home_games).to eq([game])
    end
  end

  describe '#away_games' do
    it "returns all away games scheduled for a team" do
      team1 = Team.create({name: 'TSM', coach: 'Bob'})
      team2 = Team.create({name: 'CLG', coach: 'Bob'})
      game = Game.create({home_team_id: team1.id, away_team_id: team2.id})
      expect(team2.away_games).to eq([game])
    end
  end

  describe '#games' do
    it "returns all games scheduled for a team" do
      team1 = Team.create({name: 'TSM', coach: 'Bob'})
      team2 = Team.create({name: 'CLG', coach: 'Bob'})
      game1 = Game.create({home_team_id: team1.id, away_team_id: team2.id})
      game2 = Game.create({home_team_id: team2.id, away_team_id: team1.id})
      expect(team1.games).to eq([game1, game2])
    end
  end
end
