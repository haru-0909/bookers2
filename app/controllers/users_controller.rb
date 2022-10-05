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
  end
end
