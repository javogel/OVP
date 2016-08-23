class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :create, :update, :destroy]
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
    @video = Video.find(params[:id])
    @reaction = Reaction.new
    keywords = ""

    @video.categories.each do |category|
      keywords += category.name
    end

    if session[:last_video]
      session[:last_video].unshift(params[:id])
      session[:last_video] = session[:last_video].take(5)
    end



    set_meta_tags(title: @video.name,
                      description: "",
                      keywords: keywords,
                        #  canonical: @post.canonical,
                        #  author: @post.author,
                        #  publisher: @post.publisher
                      og: {
                         title:    @video.name,
                         type:     'video.other',
                         url:      request.original_url,
                         image:    'http://img.youtube.com/vi/' + @video.youtube_id + '/mqdefault.jpg',
                        #  video:    {
                        #      director: 'http://www.imdb.com/name/nm0000881/',
                        #      writer:   ['http://www.imdb.com/name/nm0918711/', 'http://www.imdb.com/name/nm0177018/']
                        #    }
                       }
                  )

  end

  def index
    @videos = Video.all
  end


  def next
    session[:last_video] = session[:last_video] || []

    if current_user
      @video = current_user.get_next_video(session[:last_video])
    else
     @video = Video.get_random
    end

    @reaction = Reaction.new

    redirect_to action: 'show', id: @video.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

end
