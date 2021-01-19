class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy]

  def index
    @toilets = policy_scope(Toilet).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: { toilets: @toilets } }
    end

    @toilets = policy_scope(Toilet).where.not(latitude: nil, longitude: nil)

    # the `geocoded` scope filters only toilets with coordinates (latitude & longitude)
    @markers = @toilets.geocoded.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { toilet: toilet })
      }
    end

    if params[:query].present?
      @toilets = policy_scope(Toilet).search_by_name_and_description(params[:query])
    else
      @toilets = policy_scope(Toilet).all
    end

  end

  def new
    @toilet = current_user.toilets.new
    authorize @toilet
  end

  def create
    @toilet = current_user.toilets.new(toilet_params)
    # @toilet.user = current_user
    authorize @toilet
    if @toilet.save
      redirect_to toilets_path
    else
      render 'new'
    end
  end

  def show
    @review = Review.new
  end

  def edit; end

  def update
    @toilet.update(toilet_params)
    redirect_to toilet_path(@toilet)
  end

  def destroy
    @toilet.destroy
    redirect_to toilets_path
  end

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
    authorize @toilet
  end

  def toilet_params
    params.require(:toilet).permit(:name, :address, :description, photos: [])
  end
end
