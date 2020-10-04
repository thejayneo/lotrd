require 'yaml'
require 'tty-prompt'
require 'colorize'

require_relative '../model/player'
require_relative '../controller/storeBuy'
require_relative '../view/town'

module Store
    def menu
        system 'clear'
        puts "Hephy's Forge" + "\n" + "=" * 40 + "\n"*2
        prompt = TTY::Prompt.new
        prompt.select("What would you like to buy today?") do |menu|
            menu.choice 'Weapons'.colorize(:light_red), -> {::Store.weapons_menu}
            menu.choice 'Armour'.colorize(:light_yellow), -> {::Store.armour_menu}
            menu.choice '"Not buying today, just want to look around!"'.colorize(:light_green), -> {::Store.kick}
            menu.choice 'Leave'.colorize(:light_blue), -> {::Store.leave}
        end
    end

    def weapons_menu
        system 'clear'
        puts "Hephy's Forge -> Weapons Menu" + "\n" + "=" * 40 + "\n"*2
        weap_stats = YAML.load(File.read("lib/lotrd/model/weap_stats.yml"))
        weap_list = weap_stats.keys
        prompt = TTY::Prompt.new
        prompt.select("Here's what we have in stock today:") do |menu|
            weap_list.each do |name|
            menu.choice "#{name} - Cost: #{weap_stats.fetch(name).fetch(:cost)} gold", -> {::Buy.weapon(name)}
            end
            menu.choice "Return to store menu.", -> {::Store.menu}
        end
    end

    def armour_menu
        system 'clear'
        puts "Hephy's Forge -> Armours Menu" + "\n" + "=" * 40 + "\n"*2
        arm_stats = YAML.load(File.read("lib/lotrd/model/arm_stats.yml"))
        arm_list = arm_stats.keys
        prompt = TTY::Prompt.new
        prompt.select("Here's what we have in stock today:") do |menu|
            arm_list.each do |name|
            menu.choice "#{name} - Cost: #{arm_stats.fetch(name).fetch(:cost)} gold", -> {::Buy.armour(name)}
            end
            menu.choice "Return to store menu.", -> {::Store.menu}  
        end
    end

    def kick
        system 'clear'
        puts "Hephy's Forge" + "\n" + "=" * 40 + "\n"*2
        puts '"Does this look like an art gallery to you? Scram!"'
        sleep(3)
        ::Town.menu
    end

    def leave
        system 'clear'
        player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
        puts "Hephy's Forge" + "\n" + "=" * 40 + "\n"*2
        puts "Stay alive out there, #{player.name.colorize(:yellow)}!"
        sleep(3)
        ::Town.menu
    end

    def deficit
        system 'clear'
        puts "Hephy's Forge" + "\n" + "=" * 40 + "\n"*2
        puts "Hephy growls at you, \"Does it look like I'm running a charity here?\""
        puts "You should probably come back when you have enough gold on you."
        sleep(3)
        ::Store.menu
    end

    module_function :weapons_menu, 
                    :armour_menu, 
                    :leave, 
                    :menu, 
                    :kick, 
                    :deficit
end