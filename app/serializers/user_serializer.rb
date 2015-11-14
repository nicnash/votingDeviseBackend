class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :is_confirmed
  # has_many :ideas
  has_many :ideas, embed: :ids #, include: true
  has_many :votes, embed: :ids, include: true
  # embed :ids
  #   object.votes.id
  # end
  def say_hello
    "Hello #{object.email}!"
  end
end
