require_relative '../view/datacheck.rb'

module Check
    def playerData
        if File.size?("../model/playerdata.yml") == nil
            ::DataCheck.absent
        else
            ::DataCheck.present
        end
    end
    module_function :playerData
end