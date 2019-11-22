class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.page(params[:page]).reverse_order
    @user_profile = User.find(current_user.id)
  	@book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:notice] = "successfully."
        redirect_to user_path(@user.id)
    else
    	render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def current_user?(user)
    user == current_user
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user?(@user)

  end
end
