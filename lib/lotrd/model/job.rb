require_relative '../model/race'

class Job < Race
    attr_accessor :hp, :def, :res, :str, :agi, :dex, :int, :lck
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
        @agi += 15 
        @res += 20
    end

    def knight
        @hp += 15
        @str += 15
        @def += 20
    end

    def rogue
        @agi += 15
        @str += 15
        @def += 10
        @res += 10
    end

    def ranger
        @dex += 15
        @lck += 15
        @def += 15
        @res += 5
    end
end