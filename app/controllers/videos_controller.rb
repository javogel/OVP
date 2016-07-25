class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    video = Yt::Video.new url: video_params[:url]
    @embed_code = video.embed_html
    @name = video.title
    @video = Video.new(name: @name, url: video_params[:url], video_embed: @embed_code)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def show
  end

  def index
  end
end
