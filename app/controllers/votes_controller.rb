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
    puts "-------------------------------------"
    format.json { render :json =>@vote}
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

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        # format.json { render :show, status: :created, location: @vote }
        format.json { render :json =>@vote }
        
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
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
