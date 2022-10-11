class BooksController < ApplicationController
    def index
        @book = Book.new
        @books = Book.all
        @user = current_user
    end

    def show
        @book = Book.find(params[:id])
        @user = User.find(@book.user_id)
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
    end

    def edit
        @book = Book.find(params[:id])
        redirect_to request.referer
    end

    def update
        book = Book.find(params[:id])
        book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(book.id)
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to '/books'
    end



    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end
