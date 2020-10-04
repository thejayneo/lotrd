require_relative 'lotrd/controller/check'

require 'colorize'
require 'artii'
require "lotrd/version"

module Lotrd
  class Error < StandardError; end
  # Your code goes here...
  def self.start
    system 'clear'
    titleStyle = Artii::Base.new :font => 'slant'
    puts titleStyle.asciify('              Legend').colorize(:white)
    puts titleStyle.asciify('              Of The').colorize(:white)
    puts titleStyle.asciify('               Ruby').colorize(:red)                                                                                                                             
    puts titleStyle.asciify('            Dragon').colorize(:white)
    puts "\n"*2 + "A CLI remake of the text-based adventure game, #{"'Legend of the Green Dragon' (LotGD)".colorize(:green)}."
    sleep(5)
    ::Check.playerData
  end
end
