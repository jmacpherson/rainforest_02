class ReviewsController < ApplicationController
  before_filter :load_product

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@product), :notice => "Thank you for your feedback!"
    else
      render :action => "show"
    end
  end

  def edit
  end

  def update
    
  end

  private
  def review_params
    params.require(:review).permit(:content, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
