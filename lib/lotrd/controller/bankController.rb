require 'yaml'

require_relative '../view/bank'

module BankController


    def withdraw(wdw)
        player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
        gold = player.gold
        balance = player.balance
        if wdw > balance
            ::Bank.deficit
        elsif wdw < 1
            ::Bank.invalid
        else
            balance -= wdw
            gold += wdw
        end
        player.gold = gold
        player.balance = balance
        File.open(ENV['HOME'] + "/." + "playerdata.yml", 'w') {|file| File.write(ENV['HOME'] + "/." + "playerdata.yml", player.to_yaml)}
        ::Bank.withdrawConfirm(wdw, player.gold, player.balance)
    end

    def deposit(dep)
        player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
        gold = player.gold
        balance = player.balance
        if dep > gold
            ::Bank.deficit
        elsif dep < 1
            ::Bank.invalid
        else
            balance += dep
            gold -= dep
        end
        player.gold = gold
        player.balance = balance
        File.open(ENV['HOME'] + "/." + "playerdata.yml", 'w') {|file| File.write(ENV['HOME'] + "/." + "playerdata.yml", player.to_yaml)}
        ::Bank.depositConfirm(dep, player.gold, player.balance)
    end
    module_function :withdraw, 
                    :deposit
end