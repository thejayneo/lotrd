require_relative '../model/job'

class Player < Job
    attr_reader :name
    attr_accessor :gold, :balance, :weapon, :armour, :achievements, :hp, :str, :dex, :int, :lck, :agi
    
    def initialize(name)
        @name = name
        @gold = 0
        @balance = 0
        @weapon = nil
        @armour = nil
        @achievements = []
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

