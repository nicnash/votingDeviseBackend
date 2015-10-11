class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :votes
end
