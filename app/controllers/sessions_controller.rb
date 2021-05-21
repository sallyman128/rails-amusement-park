class SessionsController < ApplicationController
  def signin #get
    @user_names = User.all.map {|user| user.name }
  end

  def login #post
    user = User.find_by(name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end