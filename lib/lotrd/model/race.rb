class Race
    attr_accessor :hp, :def, :res, :str, :agi, :int, :dex, :lck
    def initialize
        @hp = 0
        @def = 0
        @res = 0
        @str = 0 
        @agi = 0
        @int = 0
        @dex = 0
        @lck = 0
    end

    def elf
        @hp = 20
        @def = 10
        @res = 20
        @str = 10 
        @agi = 30
        @int = 10
        @dex = 30
        @lck = 10
    end

    def human
        @hp = 20
        @def = 15
        @res = 15
        @str = 20 
        @agi = 10 
        @int = 20
        @dex = 20
        @lck = 20
    end

    def dwarf
        @hp = 30
        @def = 20
        @res = 10
        @str = 25 
        @agi = 15 
        @int = 10
        @dex = 10
        @lck = 20
    end

    def god
        @hp = 99999
        @def = 999
        @res = 999
        @str = 999
        @agi = 999
        @int = 999
        @dex = 999
        @lck = 999
        @achievements = ["Surreee you're a god. Cheater."]
    end

    def beast
        @hp = 66666
        @def = 666
        @res = 666
        @str = 666
        @agi = 666
        @int = 666
        @dex = 666
        @lck = 666
        @achievements = ["A beast. At cheating."]
    end
end