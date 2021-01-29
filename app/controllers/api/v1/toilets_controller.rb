class Api::V1::ToiletsController < Api::V1::BaseController
  before_action :set_toilet, only: [ :show ]

  def index
    @toilets = policy_scope(Toilet)
  end

  def show; end

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
    authorize @toilet  # For Pundit
  end

end
