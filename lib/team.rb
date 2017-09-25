#!/usr/bin/env ruby

class Team < ActiveRecord::Base
  has_many(:players)
  has_many :home_games, class_name: "Game", foreign_key: "home_team_id"
  has_many :away_games, class_name: "Game", foreign_key: "away_team_id"

  def games
    Game.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
  end
end
