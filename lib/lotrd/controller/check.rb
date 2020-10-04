require_relative '../view/datacheck.rb'

module Check
    def playerData
        if File.size?(ENV['HOME'] + "/." + "playerdata.yml") == nil
            ::DataCheck.absent
        else
            ::DataCheck.present
        end
    end
    module_function :playerData
end