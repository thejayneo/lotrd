require_relative 'v-datacheck.rb'

module Check
    def playerData
        if File.size?("m-playerdata.yml") == nil
            ::DataCheck.absent
        else
            ::DataCheck.present
        end
    end
    module_function :playerData
end