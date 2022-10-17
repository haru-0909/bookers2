class UsersController < ApplicationController
  def index
      @newbook = Book.new
      @user = User.all
      @user = current_user
  end


  def show
      @newbook = Book.new
      @user = User.find(params[:id])
      @books = @user.books
  end

  def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
  end

  def edit
      @user = current_user
  end

  def update
        @user = current_user
        if @user.update(user_params)
          flash[:notice] = "You have updated user successfully."
          redirect_to user_path(@user.id)
        else
          render :edit
        end
  end

   private

  def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
