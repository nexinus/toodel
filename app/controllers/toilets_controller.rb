class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy]

  def index
    @toilets = policy_scope(Toilet).order.where.not(created_at: :desc, latitude: nil, longitude: nil)
    # @toilets = policy_scope(Toilet).where.not(latitude: nil, longitude: nil)
    # @toilets = Toilet.where.not(latitude: nil, longitude: nil)

    # the `geocoded` scope filters only toilets with coordinates (latitude & longitude)
    @markers = @toilets.geocoded.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { toilet: toilet })
      }
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

  def show; end

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
