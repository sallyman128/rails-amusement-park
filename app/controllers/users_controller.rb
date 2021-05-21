class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end
  
  def show
    redirect_to_root_if_not_logged_in
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def redirect_to_root_if_not_logged_in
    if !session[:user_id]
      redirect_to root_path
    end
  end
end