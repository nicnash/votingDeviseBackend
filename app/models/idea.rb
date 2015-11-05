class Idea < ActiveRecord::Base
    belongs_to :user
    has_many :votes

    validates_length_of :title, :minimum => 3
    validates_length_of :description, :minimum => 3
end
