class IdeasController < ApplicationController
  respond_to :json
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
    render json: @ideas
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    # render :json =>@vote
    idea = Idea.find(params[:id])
    render json: idea, status: 200
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      render :json =>@idea, status: :created
    else
      render json: @idea.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    
    if @idea.update(idea_params)
      render :show, status: :ok, location: @idea
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    #catch exception  rescue

    @idea.destroy
      head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = current_user.ideas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description, :user_id)
    end
end
