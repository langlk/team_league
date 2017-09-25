#!/usr/bin/env ruby

require 'spec_helper'

describe('Player') do
  describe '#team' do
    it "returns the team the player belongs to" do
      team = Team.create({name: "CLG"})
      player = Player.create({name: "DoubleLift", team_id: team.id})
      expect(player.team).to eq(team)
    end
  end
end
