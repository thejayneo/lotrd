require 'colorize'
require_relative 'c-combatController.rb'
require_relative 'v-town'

module CombatView
    def start(mob)
        system 'clear'
        @mob = mob
        puts "Combat" + "\n" + "=" * 40 + "\n"*2
        puts "You move foward cautiously and find a #{@mob.name.colorize(:red)}."
        sleep(3)
        ::CombatSim.initiative
    end

    def mobStart(playerHP, mobHP)
        @currentPlayerHP = playerHP
        @currentMobHP = mobHP
        system 'clear'
        puts "Combat => Enemy turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "The #{@mob.name.colorize(:red)} sees you and attacks you suddenly!"
        sleep(5)
        ::CombatSim.mobHit
    end

    def mobTurn
        system 'clear'
        puts "Combat => Enemy turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        ::CombatSim.mobHit
    end

    def mobMiss
        puts "The #{@mob.name.colorize(:red)}'s attack missed you!"
        sleep(3)
        ::CombatSim.turnHandler
    end

    def mobTurnResolve(action, dmg, playerHP)
        @currentPlayerHP = playerHP
        system 'clear'
        puts "Combat => Enemy turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "#{@mob.name.colorize(:red)} #{
            case action
            when 1
                "swings their weapon at you and deals"
            when 2
                "fires a spell at you and deals"
            when 3
                "shoots an arrow at you and hits you for"
            end} #{dmg} damange."
        sleep(3)
        ::CombatSim.roundResolve
    end

    def playerStart(playerHP, mobHP)
        @currentPlayerHP = playerHP
        @currentMobHP = mobHP
        system 'clear'
        puts "Combat => Your turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "The #{@mob.name.colorize(:red)} hasn't noticed you yet. You get ready to surprise attack them."
        sleep(5)
        ::CombatView.playerTurn
    end

    def playerTurn
        system 'clear'
        puts "Combat => Your turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        prompt = TTY::Prompt.new
        prompt.select("What would you like to do?") do |menu|
            menu.choice 'Melee Attack'.colorize(:light_red), -> {::CombatSim.playerHit(1)}
            menu.choice 'Cast a spell'.colorize(:light_yellow), -> {::CombatSim.playerHit(2)}
            menu.choice 'Ranger attack'.colorize(:light_green), -> {::CombatSim.playerHit(3)}
            menu.choice 'Run away'.colorize(:light_blue), -> {::CombatView.escape}
        end
    end

    def playerMiss
        system 'clear'
        puts "Combat => Your turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "The #{@mob.name.colorize(:red)} was too fast for you! Your attack missed."
        sleep(3)
        ::CombatSim.turnHandler
    end

    def playerTurnResolve(action, dmg, mobHP)
        system 'clear'
        @currentMobHP = mobHP
        puts "Combat => Your turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "You #{
            case action
            when 1
                "swing your weapon at #{@mob.name} and deal"
            when 2
                "fire a spell at #{@mob.name} and deal"
            when 3
                "shoot an arrow at #{@mob.name} and hit them for"
            end} #{dmg} damange."
        sleep(3)
        ::CombatSim.roundResolve
    end

    def escape
        system 'clear'
        puts "Combat => Your turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "You attempt to run away"
        sleep(1)
        system 'clear'
        puts "Combat => Your turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "You attempt to run away."
        sleep(1)
        system 'clear'
        puts "Combat => Your turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "You attempt to run away.."
        sleep(1)
        system 'clear'
        puts "Combat => Your turn" + "\n" + "=" * 40 + "\nPlayer HP: #{@currentPlayerHP}" + "\n" + "Enemy HP: #{@currentMobHP}" + "\n" + "=" * 20 + "\n"*2
        puts "You attempt to run away..."
        sleep(1)
        ::CombatSim.escapeCheck
    end

    def escapeSuccess
        puts "You got away safely!"
        sleep(3)
        ::Town.menu
    end

    def escapeFail
        puts "You were too slow! The enemy has caught up to you!"
        sleep(3)
        ::CombatSim.turnHandler
    end

    def victory(drop)
        system 'clear'
        puts "Combat" + "\n" + "=" * 40 + "\n"*2
        puts "Congratulations, you have defeated the #{@mob.name.colorize(:red)}! Rummaging their corpse you have found #{drop} gold."
        sleep(3)
        ::Town.menu
    end

    def defeat
        system 'clear'
        puts "Combat" + "\n" + "=" * 40 + "\n"*2
        puts "You have been defeated by the overwhelming power of the #{@mob.name.colorize(:red)}! You have lost all the gold and equipment you were carrying."
        sleep(3)
        puts "Respawning"
        sleep(2)
        system 'clear'
        puts "Respawning."
        sleep(2)
        system 'clear'
        puts "Respawning.."
        sleep(2)
        system 'clear'
        puts "Respawning..."
        sleep(2)
        ::Town.menu
    end

    module_function :start, 
                    :mobStart,
                    :mobTurn,
                    :mobMiss,
                    :mobTurnResolve,
                    :playerStart,
                    :playerTurn,
                    :playerMiss,
                    :playerTurnResolve,
                    :escape,
                    :escapeSuccess,
                    :escapeFail,
                    :victory,
                    :defeat
end