class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user #&& valid_user?
      login(@user)
      redirect_to "/"
    else
      render :login
    end
  end

  def destroy
    reset_session
    redirect_to '/', :notice => "You're logged out"
  end
end
