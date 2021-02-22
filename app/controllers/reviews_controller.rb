class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @toilet = Toilet.find(params[:toilet_id])
    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    @review.toilet = @toilet
    if @review.save
      redirect_to toilet_path(@toilet, anchor: "review-#{@review.id}")
      # redirect_to new_review_path
    else
      # render 'toilets/show'
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
