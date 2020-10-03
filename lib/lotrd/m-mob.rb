require_relative 'm-job'

class Mob < Job
    attr_reader :name
    attr_accessor :gold, :balance, :weapon, :armour, :achievements, :hp, :str, :dex, :int, :lck, :agi
    
    def raceGen
        @racePick = rand(1..3)
        case @racePick
            when 1 
                elf
            when 2 
                human
            when 3 
                dwarf
        end
    end

    def jobGen
        @jobPick = rand(1..4)
        case @jobPick
            when 1 
                mage
            when 2
                knight
            when 3 
                rogue
            when 4
                ranger
        end
    end

    def nameGen
        race_array = ['Elven', 'Human', 'Dwarven']
        job_array = ['Mage','Knight','Rogue','Ranger']
        @name = race_array[@racePick - 1] + " " + job_array[@jobPick - 1]
    end

    def elf
        super
    end

    def human
        super
    end

    def dwarf
        super
    end

    def god
        super
    end

    def beast
        super
    end
    
    def mage
        super
    end

    def knight
        super
    end

    def rogue
        super
    end

    def ranger
        super
    end
end

