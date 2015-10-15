class VoteSerializer < ActiveModel::Serializer
  attributes :id 

  # has_one :user, embed: :ids, include: true
  # has_one :idea
  # def attributes
  #   {'name' => nil, 'age' => nil}
  # end
 #  def user
 #  	{
 #    id: object.user.id
	# }
 #  end
end

# class VoteSerializer < ActiveModel::Serializer
#   attributes :id, :user, :idea 

#   def user
#     # create a hash of the user attributes you want rendered
#     {
#       email: object.user.email
#       #....
#     }
#   end
  
#   def idea
#     # create a hash of the user attributes you want rendered
#     {
#       title: object.idea.title, # or whatever
#       description: object.idea.description # or whatever
#     }
#   end
# end
