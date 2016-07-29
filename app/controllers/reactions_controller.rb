class ReactionsController < ApplicationController
  def create

    @reaction = Reaction.new(
      video_id: params[:video_id],
      user_id: current_user.id,
      rating: params[:rating],
      why_watch: params[:why_watch]
    )

    @reaction.save
    redirect_to :back
  end



  def destroy
  end

  def update
  end
end
