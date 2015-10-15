class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  # has_many :ideas
  has_many :votes
  # def votes
  #   object.votes.id
  # end
  def say_hello
    "Hello #{object.email}!"
  end
end
