class ApplicationController < ActionController::Base
  include ActionView::Helpers::NumberHelper
  before_action :set_mode

  def set_mode
  	@internal_mode = request.base_url.include?('giro.chc.cl') || request.base_url.include?('localhost')
  end

  def home
    render '/home'
  end

  def delivery_cost
    cost = DeliveryCostService.price params[:commune]
    render json: { commune: params[:commune], cost: number_to_currency(cost) }
  end
end
