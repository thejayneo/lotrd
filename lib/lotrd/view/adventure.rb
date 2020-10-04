require_relative '../model/mob'
require_relative '../controller/combatController'
require_relative '../controller/adventureController'
require_relative '../model/events'
require_relative '../view/town'

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
