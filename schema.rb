require_relative 'orm'

class User < Orm::Model
  
  #field is a method in parent class (i guess) which will create a method called name that will create getter or setter idk
  puts field :name
  puts field :age
  puts field :gender
end

user  = User.new
user.name("test")

