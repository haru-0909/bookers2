class UsersController < ApplicationController
  def index
      @user = User.all
      @user = current_user
  end


  def show
      @user = User.find(params[:id])
      @books = @user.books
  end

  def edit
      @user = current_user
  end


   private

  def user_params
      params.require(:user).permit(:title, :body, :profile_image)
  end
end
