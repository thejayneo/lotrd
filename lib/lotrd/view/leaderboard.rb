require 'yaml'
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'terminal-table'

require_relative '../view/town'
require_relative '../model/player'
require_relative '../controller/leaderboardController'


module Leaderboard
    def start
        system 'clear'
        puts "Adventurer Scoreboard" + "\n" + "=" * 40 + "\n"*2
        narcissist = 0
        loadIn
        render_board
        ::LeaderboardController.menu(narcissist)
    end

    def loadIn
        @player = YAML.load(File.read("lib/lotrd/model/playerdata.yml"))
        @name = @player.name
        @gold = @player.gold
        @balance = @player.balance
        @weapon = @player.weapon
        @armour = @player.armour
        @hp = @player.hp
        @str = @player.str
        @int = @player.int
        @agi = @player.agi
        @dex = @player.dex
        @lck = @player.lck
        @achievement = @player.achievements
    end

    def render_board
        rows = []
        rows << ['Gold:', @gold]
        rows << ['Bank Balance:', @balance]
        rows << ['Max Health:', @hp]
        rows << ['Strength:', @str]
        rows << ['Intelligence:', @int]
        rows << ['Agility:', @agi]
        rows << ['Dexterity:', @dex]
        rows << ['Luck:', @lck]
        @weapon == nil ? nil : rows << ['Weapon:', @weapon]
        @armour == nil ? nil : rows << ['Armour:', @armour]
        @achievement == [] ? nil : rows << ['Achievements:', @achievement]

        titleStyle = Artii::Base.new :font => 'slant'
        table = Terminal::Table.new :title => "#{(titleStyle.asciify(@name)).colorize(:yellow)}", :headings => ['Stat', 'Points'], :rows => rows
        puts table
    end

    module_function :loadIn, 
                    :render_board, 
                    :start
end