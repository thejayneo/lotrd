require 'yaml'
require 'tty-prompt'
require 'colorize'

require_relative '../model/mob'
require_relative '../view/combatView'

module CombatSim
    def start
        mob1 = ::Mob.new
        mob1.raceGen
        mob1.jobGen
        mob1.nameGen
        #Load player stats
            player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
            @currentPlayerHP = player.hp
            @currentPlayerDef = player.def
            @currentPlayerRes = player.res
            @currentPlayerStr = player.str
            @currentPlayerAgi = player.agi
            @currentPlayerInt = player.int
            @currentPlayerDex = player.dex
            @currentPlayerLck = player.lck
        #Load mob stats
            @mobName = mob1.name
            @currentMobHP = mob1.hp
            @currentMobDef = mob1.def
            @currentMobRes = mob1.res
            @currentMobStr = mob1.str
            @currentMobAgi = mob1.agi
            @currentMobInt = mob1.int
            @currentMobDex = mob1.dex
            @currentMobLck = mob1.lck
        ::CombatView.start(mob1)
    end

    def initiative
        #Decide first-turn initiative
            if @currentPlayerAgi > @currentMobAgi;
                @turn = 'player'
                ::CombatView.playerStart(@currentPlayerHP, @currentMobHP)
            else
                @turn = 'mob'
                ::CombatView.mobStart(@currentPlayerHP, @currentMobHP)
            end
    end

    def mobHit
        @turn = 'mob'
        @currentMobDex - @currentPlayerAgi + rand(1..10) > 0 ? ::CombatSim.mobDmg : ::CombatView.mobMiss
    end

    def mobDmg
        @mobAction = rand(1..3)
        case @mobAction
        when 1
            (@currentMobStr - @currentPlayerDef) > 0 ? dmg = (@currentMobStr - @currentPlayerDef) : dmg = 0
        when 2
            (@currentMobInt - @currentPlayerRes) > 0 ? dmg = (@currentMobInt - @currentPlayerRes): dmg = 0
        when 3
            (@currentMobDex - @currentPlayerDef) > 0 ? dmg = (@currentMobDex - @currentPlayerDef) : dmg = 0
        end
        ::CombatSim.mobCrit(dmg)
    end

    def mobCrit(dmg)
        @currentMobLck - @currentPlayerLck > 9 ? ::CombatSim.mobResolve((dmg * 1.2).to_i) : ::CombatSim.mobResolve(dmg)
    end

    def mobResolve(dmg)
        @currentPlayerHP -= dmg
        ::CombatView.mobTurnResolve(@mobAction, dmg, @currentPlayerHP)
    end

    def playerHit(action)
        @turn = 'player'
        @currentPlayerDex - @currentMobAgi + rand(1..10) > 0 ? ::CombatSim.playerDmg(action) : ::CombatView.playerMiss
    end

    def playerDmg(action)
        @playerAction = action
        case @playerAction
        when 1
            (@currentPlayerStr - @currentMobDef) > 0 ? dmg = (@currentPlayerStr - @currentMobDef) : dmg = 0
        when 2
            (@currentPlayerInt - @currentMobRes) > 0 ? dmg = (@currentPlayerInt - @currentMobRes): dmg = 0
        when 3
            (@currentPlayerDex - @currentMobDef) > 0 ? dmg = (@currentPlayerDex - @currentMobRes) : dmg = 0
        end
        ::CombatSim.playerCrit(dmg)
    end

    def playerCrit(dmg)
        @currentPlayerLck - @currentMobLck > 9 ? ::CombatSim.playerResolve((dmg * 1.2).to_i) : ::CombatSim.playerResolve(dmg)
    end

    def playerResolve(dmg)
        @currentMobHP -= dmg
        ::CombatView.playerTurnResolve(@playerAction, dmg, @currentMobHP)
    end

    def escapeCheck
        @turn = 'player'
        if @currentPlayerAgi + rand(1..30) > @currentMobAgi
            ::CombatView.escapeSuccess
        else
            ::CombatView.escapeFail
        end
    end

    def turnHandler
            @turn == 'player' ? ::CombatView.mobTurn : ::CombatView.playerTurn
    end

    def roundResolve
        if @currentMobHP < 1
            reward
        elsif @currentPlayerHP < 1
            loss
        else
            turnHandler
        end
    end

    def reward
        player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
        drop = rand(20..200)
        player.gold += drop
        File.open(ENV['HOME'] + "/." + "playerdata.yml", 'w') {|file| File.write(ENV['HOME'] + "/." + "playerdata.yml", player.to_yaml)}
        ::CombatView.victory(drop)
    end

    def loss
        player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
        player.gold = 0
        player.armour = nil
        player.weapon = nil
        File.open(ENV['HOME'] + "/." + "playerdata.yml", 'w') {|file| File.write(ENV['HOME'] + "/." + "playerdata.yml", player.to_yaml)}
        ::CombatView.defeat
    end

    module_function :start,
                    :initiative, 
                    :mobHit, 
                    :mobHit, 
                    :mobDmg, 
                    :mobCrit,
                    :mobResolve,
                    :playerHit,
                    :playerDmg,
                    :playerCrit,
                    :playerResolve,
                    :escapeCheck,
                    :turnHandler,
                    :roundResolve,
                    :reward,
                    :loss
end