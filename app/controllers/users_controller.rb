class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books =@user.books
    # logger.debug('AAAAAA')
    # logger.debug(@user.inspect)

  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to show_path(user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end