class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @video = Video.new
  end

  def create
    @video = Video.create_video(params[:video][:url], current_user.id)


    respond_to do |format|
      if @video.is_a? String
        format.html { redirect_to new_video_path, notice: @video }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      elsif @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
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
  end

  def index
    @videos = Video.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

end
