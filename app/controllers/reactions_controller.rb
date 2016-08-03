class ReactionsController < ApplicationController


  def create
    if Reaction.exists?(user_id: current_user.id, video_id: params[:video_id])
      @reaction = Reaction.where(user_id: current_user.id).where(video_id: params[:video_id])[0]
      @reaction.rating = params[:reaction][:rating]
      @reaction.why_watch = params[:reaction][:why_watch]
    else
      @reaction = Reaction.new(
        video_id: params[:video_id],
        user_id: current_user.id,
        rating: params[:reaction][:rating],
        why_watch: params[:reaction][:why_watch]
      )
    end

    if @reaction.save
      flash[:notice] = "Your recommendation was saved correctly"
    else
       flash[:notice] = "Your recommendation was not processed correctly"
    end


    @video = @reaction.video

    redirect_to :controller => 'videos', :action => 'show', :id => @video.id

  end



  def destroy


  end

  def update
  end
end
