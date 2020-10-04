require_relative "combatController"
require_relative "../model/events"

module AdventureController
    def eventDecider
        eventRNG = rand(1..10)
        case eventRNG
        when (1..8)
            ::CombatSim.start
        else
            ::Adventure.event
        end
    end

    module_function :eventDecider
end