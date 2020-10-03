require 'yaml'
require 'tty-prompt'
require 'colorize'

require_relative 'v-town'
require_relative 'v-leaderboard.rb'

module LeaderboardController
    def menu(input)
        narcissist = input
        player = YAML.load(File.read("m-playerdata.yml"))
        achievement = player.achievements

        if (narcissist > 3 && achievement.include?('Narcissist') == false)
            achievement << 'Narcissist'
            player.achievements = achievement
            File.open('m-playerdata.yml', 'w') {|file| File.write('m-playerdata.yml', player.to_yaml)}
            Leaderboard::start
        else
            narcissist += 1
        end
        prompt = TTY::Prompt.new
        prompt.select("Are you done mirin'?") do |menu|
            menu.choice "Yeah, let's get back to it...".colorize(:green), -> {::Town.menu}
            menu.choice "Nah, not yet...".colorize(:red), -> {::LeaderboardController.menu(narcissist)}
        end
    end
    module_function :menu
end