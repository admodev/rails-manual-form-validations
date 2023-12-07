class UsersController < ApplicationController
  include JsonResponder

  def index
    @users = User.all

    respond_with_json("users", @users)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      if @user.save
        respond_with_json("user", @user)
      else
        respond_with_json_error("error", "cant create user.")
      end
    else
      respond_with_json_error("error", "cant validate user.")
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end

