class Api::V1::ToiletsController < Api::V1::BaseController
  def index
    @toilets = policy_scope(Toilet)
  end
end
