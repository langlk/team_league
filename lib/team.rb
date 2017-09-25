#!/usr/bin/env ruby

class Team < ActiveRecord::Base
  has_many(:players)
end
