class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:index]

  def new
    @video = Video.new
    @categories = Category.all
  end

  def create
    if @video = Video.build_from_youtube(params[:video][:url])
      @video.user = current_user
      @video.categories = Category.where(id: params[:categories])
    end

    respond_to do |format|
      if @video.present? && @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { redirect_to new_video_path, notice: "The video you entered is not valid, or already exist. Please try again." }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def show
    @reaction = Reaction.new

    session[:last_video].unshift(params[:id])
    session[:last_video] = session[:last_video].take(5)


  end

  def index
    @videos = Video.all
  end


  def next
    session[:last_video] = session[:last_video] || []

    @video = current_user.get_next_video(session[:last_video])
    @reaction = Reaction.new
    
    redirect_to action: 'show', id: @video.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

end
