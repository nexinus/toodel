class ReviewsController < ApplicationController
  def create
    @toilet = Toilet.find(params[:toilet_id])
    @review = Review.new(review_params)
    @review.toilet = @toilet
    if @review.save
      redirect_to toilet_path(@toilet)
    else
      render 'toilets/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
