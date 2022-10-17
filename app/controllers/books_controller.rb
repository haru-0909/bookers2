class BooksController < ApplicationController
    def index
        @newbook = Book.new
        @books = Book.all
        @user = current_user
    end

    def show
        @newbook = Book.new
        @book = Book.find(params[:id])
        @user = User.find(@book.user_id)
    end

    def create
        @newbook = Book.new(book_params)
        @newbook.user_id = current_user.id
        if @newbook.save
            flash[:notice] = "You have created book successfully."
            redirect_to book_path(@newbook.id)
        else
            @books = Book.all
            @user = current_user
            render :index
        end
    end

    def edit
        @user = current_user
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "You have updated book successfully."
            redirect_to book_path(@book.id)
        else
            @user = current_user
            @book = Book.find(params[:id])
            render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end



    private

    def book_params
        params.require(:book).permit(:title, :body)
    end


    def correct_user
        @book = Book.find(params[:id])
        @user = @book.user
        redirect_to(books_path) unless @user == current_user
    end
end
