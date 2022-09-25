class UsersController < ApplicationController
  def show
    @user = Book.find(params[:id])
    @books = @user.books
  end

  def edit
  end
end
