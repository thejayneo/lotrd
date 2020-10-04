require 'yaml'
require 'colorize'

require_relative '../view/town'
require_relative '../controller/bankController.rb'

module Bank
	def start
		system 'clear'
		puts "Hazelwood Bank" + "\n" + "=" * 40 + "\n"*2
        @player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
		puts "#{@player.name.colorize(:yellow)}, welcome to Hazelwood bank!"
		sleep(3)
		menu
	end

	def menu 
		system 'clear'
	 	puts "Hazelwood Bank" + "\n" + "=" * 40 + "\n"*2
		prompt = TTY::Prompt.new
        prompt.select("How can we be of service?") do |menu|
            menu.choice 'Check my balance'.colorize(:green), -> {::Bank.balance}
            menu.choice 'Make a deposit'.colorize(:yellow), -> {::Bank.depositMenu}
            menu.choice 'Make a withdrawal'.colorize(:blue), -> {::Bank.withdrawMenu}
            menu.choice 'Leave the bank'.colorize(:red), -> {::Bank.leave}
		end
	end

	def balance
		system 'clear'
        player = YAML.load(File.read(ENV['HOME'] + "/." + "playerdata.yml"))
        gold = player.gold
		balance = player.balance
		puts "Hazelwood Bank => Balance" + "\n" + "=" * 40 + "\n"*2
        puts "You are currently holding #{gold} gold and have #{balance} gold stored with us."
        sleep(3)
        ::Bank.menu
    end

	def withdrawMenu
		system 'clear'
		puts "Hazelwood Bank => Withdraw Gold" + "\n" + "=" * 40 + "\n"*2
		puts "How much would you like to withdraw?"
		wdw = gets.chomp.to_i
		::BankController.withdraw(wdw)
	end

	def withdrawConfirm(wdw, gold, balance)
		system 'clear'
		puts "Hazelwood Bank => Withdrawn Gold" + "\n" + "=" * 40 + "\n"*2
		puts "You have successfully withdrawn #{wdw} gold. You are now holding #{gold} gold and have #{balance} gold stored with us."
		sleep(3)
		::Bank.menu
	end

	def depositMenu
		system 'clear'
		puts "Hazelwood Bank => Deposit Gold" + "\n" + "=" * 40 + "\n"*2
		puts "How much would you like to deposit?"
		dep = gets.chomp.to_i
		::BankController.deposit(dep)
	end

	def depositConfirm(dep, gold, balance)
		system 'clear'
		puts "Hazelwood Bank => Deposited Gold" + "\n" + "=" * 40 + "\n"*2
		puts "You have successfully deposited #{dep} gold. You are now holding #{gold} gold and have #{balance} gold stored with us."
		sleep(3)
		::Bank.menu
	end

	def deficit
		system 'clear'
		puts "Hazelwood Bank" + "\n" + "=" * 40 + "\n"*2
		puts "You do not have enough gold for this transaction!"
		sleep(3)
		::Bank.menu
	end

	def invalid
		system 'clear'
		puts "Hazelwood Bank" + "\n" + "=" * 40 + "\n"*2
		puts "That is not a valid amount for this transaction!"
		sleep(3)
		::Bank.menu
	end

	def leave
		system 'clear'
		puts "Hazelwood Bank" + "\n" + "=" * 40 + "\n"*2
		puts "Take care out there, #{@player.name.colorize(:yellow)}"
		sleep(3)
		::Town.menu
	end
	module_function :start, 
					:leave, 
					:menu, 
					:withdrawMenu, 
					:depositMenu, 
					:balance, 
					:deficit, 
					:invalid, 
					:withdrawConfirm, 
					:depositConfirm
end