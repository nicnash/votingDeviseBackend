class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :say_hello
  has_many :ideas
  
  def say_hello
    "Hello #{object.email}!"
  end
end
