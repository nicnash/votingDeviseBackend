class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token
  # GET /users
  # GET /users.json
  def index
    puts '------------------------------'
    puts params[:filter][:email]
    @user = User.find_by_email(params[:filter][:email]) if params[:filter].present?

    render json: @user
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = User.first
    user = User.find(params[:id])
    render json: user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    puts '-----------------------create in user controller'

    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def updatepass
    puts 'update_password!!!!!----userController--------------------------------'
    # current_user
    @user = User.find(current_user.id)
    if @user.update(userpass_params)
      @user.authentication_token = generate_authentication_token
      @user.save
      # user.update_attributes(:authentication_token => "new token")
      # Sign in the user by passing validation in case their password changed
      render json: @user.authentication_token
      
      # sign_in @user, :bypass => true

      # redirect_to root_path
    else
      render json: false
      # render "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def userpass_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
