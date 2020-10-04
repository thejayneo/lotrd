require_relative '../view/newplayer'
require_relative '../view/town'

require 'artii'

module DataCheck
    def absent
        system 'clear'
        puts 'No previous player data found. Starting player generation'
        sleep(1)
        system 'clear'
        puts 'No previous player data found. Starting player generation.'
        sleep(1)
        system 'clear'
        puts 'No previous player data found. Starting player generation..'
        sleep(1)
        system 'clear'
        puts 'No previous player data found. Starting player generation...'
        sleep(1)
        ::NewPlayer.start
    end

    def present
        player = YAML.load(File.read("../model/playerdata.yml"))
        titleStyle = Artii::Base.new :font => 'slant'
        system 'clear'
        puts "Player data located. Welcome back," +"\n"*4 + "#{(titleStyle.asciify(player.name)).colorize(:yellow)}"
        sleep(3)
        system 'clear'
        puts 'Spawning'
        sleep(1)
        system 'clear'
        puts 'Spawning.'
        sleep(1)
        system 'clear'
        puts 'Spawning..'
        sleep(1)
        system 'clear'
        puts 'Spawning...'
        sleep(1)
        system 'clear'
        ::Town.menu
    end
    module_function :absent, 
                    :present
end