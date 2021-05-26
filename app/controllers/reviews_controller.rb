class ReviewsController < ApplicationController

  def index
    # this is our list page for our reviews
    @price = params[:price]

    #is there a filter for price
    if @price.present?
      #filter by price
    else
      #all the reviews
      @reviews = Review.all

    end

  end

  def new
    @review = Review.new
  end

  def create
    # take info from the form and it to the database
    @review = Review.new(form_params)
    @review.save

     if @review.save
       redirect_to root_path
     else
       #show the view
       render "new"
     end
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

      if @review.update(form_params)

        redirect_to review_path(@review)
      else

       render "edit"

      end

  end

  def form_params

    params.require(:review).permit(:title,:restaurant,:body,:score, :ambiance, :cusine, :price)

  end


end
