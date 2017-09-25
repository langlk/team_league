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
end
