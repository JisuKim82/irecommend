class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to "/"
    else
      redirect_to '/login', :notice => "Invalid email/password"
    end
  end

  def destroy
    reset_session
    redirect_to '/login', :notice => "You're logged out"
  end
end
