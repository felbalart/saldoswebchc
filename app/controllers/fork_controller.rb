class ForkController < ApplicationController
  layout false

  def index
  @input = params[:q]
  if @input.present?
    @rut = @input.delete(".").split("-").first
    @worker = Worker.find_by(rut: @rut)
    if @worker.nil?
      @msg = 'No se encuentra el rut ingresado'
      @name = ''
      @color = :red
    elsif !@worker.active
      @name = @worker.name
      @msg = 'ESTADO: NO HABILITADO'
      @color = :red
    else #found and active => ok
      @name = @worker.name
      @msg = 'ESTADO: HABILITADO'
      @color = :green
    end
  end
  end
end
