require 'json'

module Orm
    class Model

        def initialize(attrs = {})
            @data = {}
            attrs.each do |key, value|
                send(key, value)
            end
        end

        def self.inherited(child_class)
            child_class.instance_variable_set(:@table, child_class.name)
        end
        

        def save
            self.class.write(@data)
        end

        def self.field(fieldName)
            define_method (fieldName) do |value|
                @data[fieldName] = value
            end
        end

        def self.write(data)
            file = "db.json"

            db = File.exist?(file) ? JSON.parse(File.read(file)) : {}
            puts @table

            id = "#{@table}#{db.length + 1}"

            db[id] = data

            File.write(file, JSON.pretty_generate(db))
        end

    end
end




