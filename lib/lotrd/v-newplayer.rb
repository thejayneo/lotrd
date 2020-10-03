require_relative 'c-playergen'
require_relative 'v-town'
require 'yaml'

module NewPlayer
    def start
        playerName
        raceOptions
        jobOptions
        ::Town.menu
    end

    def playerName
        system 'clear'
        puts "What is the name of your character?"
        name = gets.chomp
        ::PlayerGen.playerName(name)
    end

    def raceOptions
        system 'clear'
        puts 'What race would you like to play? (Select 1-3)'
        puts '1. Elf'
        puts '2. Human'
        puts '3. Dwarf'
        raceinput = gets.chomp.to_i  
        ::PlayerGen.race(raceinput) 
    end

    def jobOptions
        system 'clear'
        puts 'What job would you like to play? (Select 1-4)'
        puts '1. Mage'
        puts '2. Knight'
        puts '3. Rogue'
        puts '4. Ranger'
        jobinput = gets.chomp.to_i
        ::PlayerGen.job(jobinput)
    end
    module_function :start, 
                    :raceOptions, 
                    :jobOptions, 
                    :playerName
end