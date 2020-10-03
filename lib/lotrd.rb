require_relative 'lotrd/v-town.rb'
require_relative 'lotrd/v-newplayer'
require_relative 'lotrd/c-check'
require_relative 'lotrd/'

require 'colorize'
require 'artii'
require "lotrd/version"

module Lotrd
  class Error < StandardError; end
  # Your code goes here...
  def self.start
    system 'clear'
    titleStyle = Artii::Base.new :font => 'slant'
    puts titleStyle.asciify('              Legend')
    puts titleStyle.asciify('              Of The')
    puts titleStyle.asciify('               Ruby').colorize(:red)                                                                                                                             
    puts titleStyle.asciify('            Dragon')
    puts "\n"*2 + "A CLI remake of the text-based adventure game, #{"'Legend of the Green Dragon' (LotGD)".colorize(:green)}."
    sleep(5)
    ::Check.playerData
  end
end
