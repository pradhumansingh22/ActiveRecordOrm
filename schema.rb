require_relative 'orm'

class User < Orm::Model
  
  #field is a method in parent class (i guess) which will create a method called name that will create getter or setter idk
  field :name
  field :age
  field :gender

end

class Image < Orm::Model
    field :name
    field :url
end

user  = User.new(name:'Jhon', age:29)
image = Image.new(name:'Test Image', url:'google/images/get/sidjfisd23434')
user.save()
image.save


