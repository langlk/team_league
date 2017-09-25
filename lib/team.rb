#!/usr/bin/env ruby

class Team < ActiveRecord::Base
  has_many(:players)
  has_many :home_games, class_name: "Game", foreign_key: "home_team_id"
  has_many :away_games, class_name: "Game", foreign_key: "away_team_id"

  def games
    Game.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
  end

  def wins
    win_tally = 0;
    self.games.each do |game|
      if game.home_team_id == self.id
        if game.home_team_score > game.away_team_score
          win_tally += 1
        end
      else
        if game.home_team_score < game.away_team_score
          win_tally += 1
        end
      end
    end
    win_tally
  end

  def losses
    self.games.length - self.wins
  end
end
