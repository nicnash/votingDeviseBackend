# class SessionsController < ApplicationController
# end

class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    puts '-----------------------create in devise sesions controller'
    super do |user|
      user.authentication_token = generate_authentication_token
      user.save
      data = {
        token: user.authentication_token,
        email: user.email
      }
      
      render json: data, status: 201 and return
      
    end
  end

  private
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end

  
end