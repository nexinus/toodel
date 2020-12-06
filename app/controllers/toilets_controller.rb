class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy]

  def index
    @toilets = policy_scope(Toilet).order(created_at: :desc)
  end

  def new
    @toilet = current_user.toilets.new
    authorize @toilet
  end

  def create
    @toilet = current_user.toilet.new(toilet_params)
    authorize @toilet
    # @toilet.user = current_user
    if @toilet.save
      redirect_to toilets_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update?
    record.user == user
    @toilet.update(toilet_params)
    redirect_to toilet_path(@toilet)
  end

  def destroy?
    record.user == user
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
