class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
    redirect_to '/'
    else
      render ':new', :notice => "Passwords do not match"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end
end
