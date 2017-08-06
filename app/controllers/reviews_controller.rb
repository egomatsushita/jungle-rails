class ReviewsController < ApplicationController
  before_filter :require_login

  def create
    @product_id = params[:product_id]
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.product_id = @product_id

    if review.save
      redirect_to product_path(id: @product_id), notice: 'Review created'
    else
      redirect_to product_path(id: @product_id)
    end
  end

  def destroy
      puts "PARAMS INSPECT #{params}"

    @review_id = params[:id]
    @product_id = params[:product_id]
    @review = Review.find_by(id: @review_id)
    @review.destroy
    redirect_to product_path(id: @product_id)
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end

    def require_login
      unless current_user
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/login'
      end
    end
end
