class ApplicationController < ActionController::Base
  include ActionView::Helpers::NumberHelper
  def home
    render '/home'
  end

  def delivery_cost
    cost = DeliveryCostService.price params[:commune]
    render json: { commune: params[:commune], cost: number_to_currency(cost) }
  end
end
