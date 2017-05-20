class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def edit
    redirect_to root_path unless @user.id == current_user.id
  end

  def update
    @user.update(user_params)
    @user.valid? ? (redirect_to root_path) : (redirect_to edit_user_path)
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
