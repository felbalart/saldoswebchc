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

  def certificate
    @worker = Worker.find_by(rut: params[:rut])
    @date = Date.yesterday
    raise ActionController::RoutingError.new('Not Found') unless @worker
  end

  def all
    str = [:id, :creado_en, :periodo, :destino, :nombres, :apellido1, :apellido2, :tipodoc, :paisdoc, :numdoc, :dv, :fechanac, :domicilio, :comuna, :mail, :genero, :patente, :funcion_rol, :esencial, :interregional, :role, :area_trabajo].join(';')
    str += "\n"
    str += Salvoconducto.order('id asc').map(&:to_csv).join("\n")
    render plain: str
  end


  # Never trust parameters from the scary internet, only allow the white list through.
    def salvoconducto_params
      params.require(:salvoconducto).permit(:periodo, :destino, :nombres, :apellido1, :apellido2, :tipodoc, :paisdoc, :numdoc, :dv, :fechanac, :domicilio, :comuna, :mail, :genero, :interregional, :role, :area_trabajo)
    end
end