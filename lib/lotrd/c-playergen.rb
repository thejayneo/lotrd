require_relative 'v-newplayer'
require_relative 'm-player'
require_relative 'm-race'
require_relative 'm-job'

module PlayerGen
    def playerName(input)
        @player = Player.new(input)
    end

    def race(input)
        case input
            when 1 
                @player.elf
            when 2 
                @player.human
            when 3 
                @player.dwarf
            when 666 
                system 'clear'
                puts 'Number of the Beast acknowledged. BEAST MODE ACTIVATED.'
                sleep(3)
                system 'clear'
                @player.beast
            when 777 
                system 'clear'
                puts 'Holiest number acknowledged. GOD MODE ACTIVATED.'
                sleep(3)
                system 'clear'
                @player.god
            else 
                system 'clear'
                puts "Invalid input. Please select a valid option (1-3)."
                sleep(3)
                system 'clear'
                ::NewPlayer.raceOptions
            end
        end

        def job(input)
            case input
                when 1 
                    @player.mage
                when 2
                    @player.knight
                when 3 
                    @player.rogue
                when 4
                    @player.ranger
                else 
                    system 'clear'
                    puts "Invalid input. Please select a valid option (1-4)."
                    sleep(3)
                    system 'clear'
                    ::NewPlayer.jobOptions
                end
                File.open('m-playerdata.yml', 'w') {|file| File.write('m-playerdata.yml', @player.to_yaml)}
            end
    module_function :race, 
                    :job, 
                    :playerName
end