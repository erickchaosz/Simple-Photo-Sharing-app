class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @photos = @user.photos
  end

  def login

  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
    end
end
