require_relative 'v-town'
require_relative 'v-newplayer'
require_relative 'c-check'
require 'colorize'
require 'artii'

system 'clear'
titleStyle = Artii::Base.new :font => 'slant'
puts titleStyle.asciify('              Legend')
puts titleStyle.asciify('              Of The')
puts titleStyle.asciify('               Ruby').colorize(:red)                                                                                                                             
puts titleStyle.asciify('            Dragon')
puts "\n"*2 + "A CLI remake of the text-based adventure game, #{"'Legend of the Green Dragon' (LotGD)".colorize(:green)}."
sleep(5)
::Check.playerData