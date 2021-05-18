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
    @review = Review.new(form_params)
    @review.save

    redirect_to root_path
  end

  def show
    #individual review page
    @review = Review.find(params[:id])
  end

  def destroy
    #find individual review
      @review = Review.find(params[:id])
    #destroy
      @review.destroy
    #redirect to the home page
      redirect_to root_path
  end

  def edit

      @review = Review.find(params[:id])
  end

  def update
      @review = Review.find(params[:id])
      @review.update(params.require(:review).permit(:title, :body, :score))
      redirect_to review_path(@review)
  end

  def form_params

    params.require(:review).permit(:title,:body,:score)

  end


end
