class FollowsController < ApplicationController
  
  def create
    @followable = User.find(params[:followable])
    @follow = current_user.follow(@followable)
    if @follow.save
      flash[:notice] = "You are now following one more parent."
      redirect_to root_url
    else
      flash[:error] = "Unable to follow this parent."
      redirect_to root_url
    end
  end

  def destroy
    @followable = User.find(params[:followable])
    current_user.stop_following(params[:followable])
    flash[:notice] = "You are no longer following this parent."
    redirect_to current_user
  end


end
