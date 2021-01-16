class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy]

  def index
    @toilets = policy_scope(Toilet).order(created_at: :desc)

    # @toilets = policy_scope(Toilet).order(created_at: :desc).where.not(latitude: nil, longitude: nil)
    @toilets = policy_scope(Toilet).where.not(latitude: nil, longitude: nil)
    @markers = @toilets.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        infoWindow: { content: render_to_string(partial: "/toilets/map_box", locals: { toilet: toilet }) }
        # Uncomment the above line if you want each of your markers to display a info window when clicked
        # (you will also need to create the partial "/toilets/map_box")
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
