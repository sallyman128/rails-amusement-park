class RidesController < ApplicationController
  def update
    user = User.find_by(id: session[:user_id])
    attraction = Attraction.find_by(id: params[:id])
    attraction.users << user
    redirect_to user_path(user)
  end
end