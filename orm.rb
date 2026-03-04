module Orm
    class Model
        def self.inherited(child_class)
            @table = child_class
            @fields = child_class
            self.write
        end

        def self.print ()
            puts 'hey', @table
        end

        def self.write
            File.write('db.json', "#{@table}{}", mode:'a')
        end

        def self.field(fieldName)
            File.write('db.json', "#{fieldName}", mode:'a')
            define_method (fieldName) do |value|
                File.write('db.json', "#{value}", mode:'a')
                puts 'hi'
                fieldName
            end
        end

    end
end




