class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :count
  has_many :votes

  def count
    object.votes.length
  end
end
