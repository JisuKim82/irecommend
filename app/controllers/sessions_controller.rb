class SessionsController < ApplicationController
  def login
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :login
    end
  end
end
