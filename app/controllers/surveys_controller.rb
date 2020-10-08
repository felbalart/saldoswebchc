class SurveysController < ApplicationController
  layout false

  def new
   read_data
   @already_exists = Survey.exists?(company: @company, sic_number: @sic_number)
  end

  def create
    read_data
    qu = params[:quality].to_i
    sp = params[:speed].to_i
    raise "Wrong answers qu=#{qu}, sp=#{sp}" unless qu > 0 && sp > 0
    Survey.create!(company: @company, sic_number: @sic_number, title: @title, quality: qu, speed: sp)
    redirect_to("/encuestas/#{@encoded_full_name}")
  end

  def read_data
     @full_name = params[:full_name]
    raise ActionController::RoutingError.new('Not Found') unless @full_name
    name = @full_name.split(':').first
    @company = if name[0..2] == 'SIC'
      'chc'
    elsif name[0..8] == 'DELFINSIC'
      'delfin'
    else
      raise "Wrong Name #{name}"
    end
    @decoded_full_name = URI.decode(@full_name)
    @encoded_full_name = URI.encode(@full_name)
    @title = @decoded_full_name.gsub("#{name}:",'').strip
    @sic_number = name.gsub('DELFINSIC', '').gsub('SIC', '').to_i
  end
end