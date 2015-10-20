# class SessionsController < ApplicationController
# end

class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    puts '-----------------------create in devise sesions controller'
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email
        }
        render json: data, status: 201 and return
      end
    end
  end
end