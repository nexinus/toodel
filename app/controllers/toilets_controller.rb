class ToiletsController < ApplicationController
  def index
    @toilets = Toilet.all
  end

  def show
    @toilet = Toilet.find(params[:id])
  end

  def new
    @toilet = Toilet.new
  end

  def create
    @toilet = Toilet.new(toilet_params)
    if @toilet.save
      redirect_to toilets_path(@toilet)
    else
      render 'new'
    end
  end

  private

  def toilet_params
    params.require(:toilet).permit(:name, :description)
  end
end
