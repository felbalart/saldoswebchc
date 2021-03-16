class Salvoconducto < ApplicationRecord

DESTINOS = ['CHC Las Condes (Casa Matriz)','CHC CD Lampa',
  'CHC La Serena','CHC Viña del Mar','CHC Talca', 'CHC Concepcion', 'CHC Temuco','CHC Puerto Montt',
  'Delfin Carmen o ADT', 'Delfin Planta Lampa', 'Delfin Coquimbo','Delfin Curico','Delfin Puerto Montt']
TIPODOCS = ['Run', 'Pasaporte/DNI']
PAISDOCS = ['CHILE','VENEZUELA','BRASIL','COLOMBIA','HAITI','PERÚ','ARGENTINA','BOLIVIA','ECUADOR','URUGUAY']
COMUNAS = ['SANTIAGO', 'ALHUÉ']
GENEROS = ['M','F']
INTERREGIONALS = ['No','Si']
DVS = ['1','2','3','4','5','6','7','8','9','0','K']
PERIODOS = [
'P01 SEMANA => [Jueves 18 marzo a Viernes 19 marzo] (2 dias) Hora Corte: Miercoles 17 marzo 17:00',
'P02 FIN DE SEMANA => [Sábado 20 marzo a Domingo 21 marzo] (2 dias) Hora Corte: Viernes 19 marzo 17:00',
'P03 SEMANA => [Lunes 22 marzo a Viernes 26 marzo] (7 días) Hora Corte: Viernes 19 marzo 17:00',
'P04 FIN DE SEMANA => [Sábado 27 marzo a Domingo 28 marzo] (2 dias) Hora Corte: Viernes 19 marzo 17:00',
'P05 SEMANA => [Lunes 29 marzo a Viernes 2 abril] (7 días) Hora Corte: Viernes 26 marzo 17:00']

validates :nombres, :apellido1, :numdoc, :dv,
:fechanac, :domicilio, :mail, presence: true
validates :periodo, inclusion: PERIODOS
validates :destino, inclusion: DESTINOS
validates :tipodoc, inclusion: TIPODOCS
validates :paisdoc, inclusion: PAISDOCS
validates :comuna, inclusion: COMUNAS
validates :genero, inclusion: GENEROS
validates :interregional, inclusion: INTERREGIONALS
validates :dv, inclusion: DVS
validates :numdoc, numericality: true
validates :numdoc, length: { minimum: 7, maximum: 8 }
validates :numdoc, uniqueness: { scope: :periodo }


def ofuscate str
  return str if str.to_s.length < 4
  str[0..1] + (['*']*(str.length - 4)).join + str[-2..-1]
end

def resume
  data = []
  data << "ID: #{id}"
  data << periodo
  data << destino
  data << numdoc
  data << ofuscate(nombres)
  data << ofuscate(apellido1)
  data << "Desde #{comuna}"
  data << ofuscate(mail)
  data << "Creado el #{created_at.in_time_zone('Santiago').strftime("%d/%m/%Y %H:%M:%S")}"
  data.join(' | ')
end

end

# == Schema Information
#
# Table name: salvoconductos
#
#  id            :bigint(8)        not null, primary key
#  periodo       :string
#  destino       :string
#  nombres       :string
#  apellido1     :string
#  apellido2     :string
#  tipodoc       :string
#  paisdoc       :string
#  numdoc        :string
#  dv            :string
#  fechanac      :date
#  domicilio     :string
#  comuna        :string
#  mail          :string
#  genero        :string
#  patente       :string
#  interregional :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
