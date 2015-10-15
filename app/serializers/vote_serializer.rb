class VoteSerializer < ActiveModel::Serializer
  attributes :id 
  # has_one :user
  # has_one :idea
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
