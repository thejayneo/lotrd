require_relative '../view/datacheck.rb'

module Check
    def playerData
        if File.size?("lib/lotrd/model/playerdata.rb") == nil
            ::DataCheck.absent
        else
            ::DataCheck.present
        end
    end
    module_function :playerData
end