require_relative 'm-race'

class Job < Race
    attr_accessor :hp, :str, :agi, :dex, :int, :lck
    def initialize
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
        @int += 15 
        @dex += 15 
    end

    def knight
        @hp += 15
        @str += 15
    end

    def rogue
        @agi += 15
        @str += 15
    end

    def ranger
        @dex += 15
        @lck += 15
    end
end