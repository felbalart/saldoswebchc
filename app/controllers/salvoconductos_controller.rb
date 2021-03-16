class SalvoconductosController < ApplicationController
  layout false


  def new
    @salvoconducto = Salvoconducto.new
  end

    def create
    @salvoconducto = Salvoconducto.new(salvoconducto_params)

    respond_to do |format|
      if @salvoconducto.save
        format.html { redirect_to :salvoconductos, notice: 'Solicitud de Salvoconducto Fue Registrada Correctamente' }
        format.json { render :show, status: :created, location: @salvoconducto }
      else
        format.html { render :new }
        format.json { render json: @salvoconducto.errors, status: :unprocessable_entity }
      end
    end
  end


  # Never trust parameters from the scary internet, only allow the white list through.
    def salvoconducto_params
      params.require(:salvoconducto).permit(:periodo, :destino, :nombres, :apellido1, :apellido2, :tipodoc, :paisdoc, :numdoc, :dv, :fechanac, :domicilio, :comuna, :mail, :genero, :interregional, :role)
    end
end