class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #does it make sense to set this in both the sessions and user controller?
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit #don't really need
  end

  def update
  end

  def index
    @users = User.all
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :email, :password_confirmation)
  end


end
