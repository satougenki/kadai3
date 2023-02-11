class BooksController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
   
    
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   if
     @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
   redirect_to book_path(@book.id)

    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "本当に消しますか？"
    redirect_to books_path
  end

 private

 def is_matching_login_user
    @book = Book.find(params[:id])
    user_id = @book.user.id
    unless user_id == current_user.id
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end