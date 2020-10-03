require_relative 'm-mob'
require_relative 'c-combatController'
require_relative 'c-adventureController'
require_relative 'm-events'
require_relative 'v-town'

module Adventure
    def start
        system 'clear'
		puts "Adventure" + "\n" + "=" * 40 + "\n"*2
        puts "You walk through the woods and hear a rustling sound ahead..."
        sleep(3)
        ::AdventureController.eventDecider
    end

    def event
        puts "#{::Events.adventure}"
        sleep(3)
        ::Town.menu
    end
    module_function :start,
                    :event
end
