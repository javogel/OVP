class ReactionsController < ApplicationController


  def create

    @reaction = Reaction.new(
      video_id: params[:video_id],
      user_id: current_user.id,
      rating: params[:rating],
      why_watch: params[:why_watch]
    )

    if @reaction.user_id != Video.find(@reaction.video_id).user_id
      @reaction.save
    else
       flash[:notice] = "Your recommendation was not processed correctly"
    end


    redirect_to :back
  end



  def destroy
  end

  def update
  end
end
