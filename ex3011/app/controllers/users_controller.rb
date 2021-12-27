class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def show
    @user.inspect
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your account was created successfully!"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account was updated successfully!"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Account was successfully deleted!"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :birthday, :phone)
    end
    def find_user
      @user = User.find(params[:id])
    end
end
