require_relative "c-combatController"
require_relative "m-events"

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