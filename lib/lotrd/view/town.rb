require 'yaml'
require 'tty-prompt'
require 'colorize'
require 'artii'

require_relative 'adventure'
require_relative 'bank'
require_relative 'store'
require_relative 'leaderboard'
require_relative '../model/events'

module Town
    def menu
        system 'clear'
        player = YAML.load(File.read("../model/playerdata.yml"))
        puts "Welcome to #{'Hazelwood'.colorize(:magenta)}, #{player.name.colorize(:yellow)}!" + "\n" + "=" * 40 + "\n"*2
        puts ::Events.town + "\n"*2
        prompt = TTY::Prompt.new
        prompt.select("What would you like to do?") do |menu|
            menu.choice 'Adventure'.colorize(:green), -> {::Adventure.start}
            menu.choice 'Bank'.colorize(:yellow), -> {::Bank.start}
            menu.choice 'Store'.colorize(:blue), -> {::Store.menu}
            menu.choice 'Leaderboard'.colorize(:light_magenta), -> {::Leaderboard.start}
            menu.choice 'Quit'.colorize(:red), -> {::Town.quit}
        end
    end

    def quit
        system 'clear'
        player = YAML.load(File.read("../model/playerdata.yml"))
        system 'clear'
        titleStyle = Artii::Base.new :font => 'slant'
        puts "Thanks for playing! See you next time," +"\n"*4 + "#{(titleStyle.asciify(player.name)).colorize(:yellow)}"
        sleep(3)
        exit!
    end

    module_function :quit,
                    :menu
end
