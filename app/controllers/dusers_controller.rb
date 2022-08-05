class DusersController < ApplicationController
  before_action :set_duser, only: [:show]

  # GET /dusers
  # GET /dusers.json
  def index
    @dusers = Duser.all.order(:last_name1)
  end

  # GET /dusers/1
  # GET /dusers/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_duser
      @duser = Duser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def duser_params
      params.fetch(:duser, {})
    end
end
