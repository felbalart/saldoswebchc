class FixedAssetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout false

  def new
  end

  def create
  	fp = params.permit!.to_h.symbolize_keys
  	puts fp
  	duser = ProcessFixedAssetsForm.new.run(fp)
  	redirect_to(thanks_path("#{duser.id}#{duser.u3l}"))
  end

  def thanks
  	ustr = params[:user]
  	uid = ustr[0..ustr.length-4].to_i
  	@duser = Duser.find(uid)
  	u3l = ustr[-3..ustr.length]
  	raise "No se encuentra ustr #{ustr}" if u3l != @duser.u3l
  end
end