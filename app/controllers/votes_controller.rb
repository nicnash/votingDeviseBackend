class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    # @votes = Vote.all
    # render :json => @votes
    @votes = Vote.all
    render json: @votes
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    # puts "-------------------------------------"
    # format.json { render :json =>@vote}
    vote = Vote.find(params[:id])
    render json: vote, status: 200
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    puts 'heLOOOOOOOoooooooooooo'
    # puts request.raw_post
    # logger.debug " params: #{vote_params}"
    # puts 'heLOOOOOOOoooooooooooo'
    # puts vote_params
    # grades = { "user_id" => request.raw_post.vote.user_id, "idea_is" => request.raw_post.vote.idea_id }.to_h
    # puts grades
    # poost = {:user_id => "1", :idea_id => "2"}
    # {"user_id"=>"1", "idea_id"=>"2"}
    @vote = Vote.new(vote_params)
    # @vote = Vote.new({"user_id"=>"1", "idea_id"=>"2"})

    if @vote.save
      render :json =>@vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    if @vote.update(vote_params)
      render :show, status: :ok, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end

  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
      format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:user_id, :idea_id)
    end
end
