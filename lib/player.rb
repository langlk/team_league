#!/usr/bin/env ruby

class Player < ActiveRecord::Base
  belongs_to(:team)
end
