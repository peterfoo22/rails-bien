class ReviewsController < ApplicationController

  def index
    # this is our list page for our reviews
    @number = rand(100)
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    # take info from the form and it to the database
    @review = Review.new(params.require(:review).permit(:title, :body, :score))
    @review.save

    redirect_to root_path
  end

  def show
    #individual review page
    @review = Review.find(params[:id])
  end


end
