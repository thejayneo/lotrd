require 'yaml'

require_relative '../view/store.rb'

module Buy
    def weapon(item)
        system 'clear'
        puts "Hephy's Forge -> Weapons Menu -> Weapon Purchase" + "\n" + "=" * 40 + "\n"*2
        player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
        weap_stats = YAML.load(File.read("lib/lotrd/model/weap_stats.yml"))
        gold = player.gold
        weapon = player.weapon
        hp = player.hp
        str = player.str
        int = player.int
        agi = player.agi
        dex = player.dex
        lck = player.lck
        cost = weap_stats.fetch(item).fetch(:cost).to_i
            if cost > gold
                ::Store.deficit
            else 
                if weapon != nil
                    str += weap_stats.fetch(item).fetch(:playerStr) - weap_stats.fetch(weapon).fetch(:playerStr) 
                    agi += weap_stats.fetch(item).fetch(:playerAgi) - weap_stats.fetch(weapon).fetch(:playerAgi)
                    int += weap_stats.fetch(item).fetch(:playerInt) - weap_stats.fetch(weapon).fetch(:playerInt)
                    dex += weap_stats.fetch(item).fetch(:playerDex) - weap_stats.fetch(weapon).fetch(:playerDex)
                    lck += weap_stats.fetch(item).fetch(:playerLck) - weap_stats.fetch(weapon).fetch(:playerLck)
                    puts "You threw away your #{weapon} and picked up the gleaming #{item}!"
                else
                    str += weap_stats.fetch(item).fetch(:playerStr)
                    agi += weap_stats.fetch(item).fetch(:playerAgi)
                    int += weap_stats.fetch(item).fetch(:playerInt)
                    dex += weap_stats.fetch(item).fetch(:playerDex)
                    lck += weap_stats.fetch(item).fetch(:playerLck)
                    puts "You give your new #{item} a flourish. It'll be good to stop hitting things with your bare knuckles."
                end
                gold -= cost
                weapon = item
            end
        player.gold = gold
        player.weapon = weapon
        player.str = str
        player.agi = agi
        player.dex = dex
        player.int = int
        player.lck = lck
        File.open(ENV['HOME'] + "/." + "playerdata.yml", 'w') {|file| File.write(ENV['HOME'] + "/." + "playerdata.yml", player.to_yaml)}
        sleep(3)
        ::Store.menu
    end

    def armour(item)
        system 'clear'
        puts "Hephy's Forge -> Armours Menu -> Armour Purchase" + "\n" + "=" * 40 + "\n"*2
        player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
        arm_stats = YAML.load(File.read("lib/lotrd/model/arm_stats.yml"))
        gold = player.gold
        armour = player.armour
        hp = player.hp
        str = player.str
        int = player.int
        agi = player.agi
        dex = player.dex
        lck = player.lck
        cost = arm_stats.fetch(item).fetch(:cost).to_i
            if cost > gold
                ::Store.deficit
            else 
                if armour != nil
                    hp += arm_stats.fetch(item).fetch(:playerHP) - arm_stats.fetch(armour).fetch(:playerHP) 
                    str += arm_stats.fetch(item).fetch(:playerStr) - arm_stats.fetch(armour).fetch(:playerStr) 
                    agi += arm_stats.fetch(item).fetch(:playerAgi) - arm_stats.fetch(armour).fetch(:playerAgi)
                    int += arm_stats.fetch(item).fetch(:playerInt) - arm_stats.fetch(armour).fetch(:playerInt)
                    dex += arm_stats.fetch(item).fetch(:playerDex) - arm_stats.fetch(armour).fetch(:playerDex)
                    lck += arm_stats.fetch(item).fetch(:playerLck) - arm_stats.fetch(armour).fetch(:playerLck)
                    puts "You discarded your #{armour} and put on the shiny #{item}!"
                else
                    hp += arm_stats.fetch(item).fetch(:playerHP)
                    str += arm_stats.fetch(item).fetch(:playerStr)
                    agi += arm_stats.fetch(item).fetch(:playerAgi)
                    int += arm_stats.fetch(item).fetch(:playerInt)
                    dex += arm_stats.fetch(item).fetch(:playerDex)
                    lck += arm_stats.fetch(item).fetch(:playerLck)
                    puts "You put on the #{item}. It's good to be less naked!"
                end
                gold -= cost
                armour = item
            end
        player.gold = gold
        player.armour = armour
        player.hp = hp
        player.str = str
        player.agi = agi
        player.dex = dex
        player.int = int
        player.lck = lck
        File.open(ENV['HOME'] + "/." + "playerdata.yml", 'w') {|file| File.write(ENV['HOME'] + "/." + "playerdata.yml", player.to_yaml)}
        sleep(3)
        ::Store.menu
    end
    module_function :weapon, 
                    :armour
end