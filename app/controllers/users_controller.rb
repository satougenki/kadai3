class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]
before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books =@user.books
    @book = Book.new
    # logger.debug('AAAAAA')
    # logger.debug(@user.inspect)

  end

  def edit
     @user = User.find(params[:id])
  end
 

  def update
     @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end


  private
  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
       redirect_to user_path(current_user.id)
     end
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to books_path
    end
  end

  
end