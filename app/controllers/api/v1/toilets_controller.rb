class Api::V1::ToiletsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_toilet, only: [ :show, :update ]

  def index
    @toilets = policy_scope(Toilet)
  end

  def show; end

  def update
    if @toilet.update(toilet_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
    authorize @toilet  # For Pundit
  end

  def toilet_params
    params.require(:toilet).permit(:name, :address, :description, photos: [])
  end

  def render_error
    render json: { errors: @toilet.errors.full_messages },
      status: :unprocessable_entity
  end
end
