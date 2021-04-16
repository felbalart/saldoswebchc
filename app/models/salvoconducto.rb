class Salvoconducto < ApplicationRecord

DESTINOS = ['CHC Las Condes (Casa Matriz)','CHC CD Lampa',
  'CHC La Serena','CHC Viña del Mar','CHC Talca', 'CHC Concepcion', 'CHC Temuco','CHC Puerto Montt']
  #'Delfin Carmen o ADT', 'Delfin Planta Lampa', 'Delfin Coquimbo','Delfin Curico','Delfin Puerto Montt']
TIPODOCS = ['Run', 'Pasaporte/DNI']
PAISDOCS = ['CHILE','VENEZUELA','BRASIL','COLOMBIA','HAITI','PERÚ','ARGENTINA','BOLIVIA','ECUADOR','URUGUAY']
COMUNAS = ['ALGARROBO', 'ALHUÉ', 'ALTO BIOBÍO', 'ALTO DEL CARMEN', 'ALTO HOSPICIO', 'ANCUD', 'ANDACOLLO', 'ANGOL', 'ANTOFAGASTA', 'ANTUCO', 'ARAUCO', 'ARICA', 'AYSÉN', 'BUIN', 'BULNES', 'CABILDO', 'CABO DE HORNOS', 'CABRERO', 'CALAMA', 'CALBUCO', 'CALDERA', 'CALERA DE TANGO', 'CALLE LARGA', 'CAMARONES', 'CAMIÑA', 'CANELA', 'CAÑETE', 'CARAHUE', 'CARTAGENA', 'CASABLANCA', 'CASTRO', 'CATEMU', 'CAUQUENES', 'CERRILLOS', 'CERRO NAVIA', 'CHAITÉN', 'CHANCO', 'CHAÑARAL', 'CHÉPICA', 'CHIGUAYANTE', 'CHILE CHICO', 'CHILLÁN', 'CHILLÁN VIEJO', 'CHIMBARONGO', 'CHOLCHOL', 'CHONCHI URBANO', 'CHONCHI RURAL', 'CURACO DE VÉLEZ RURAL', 'CISNES', 'COBQUECURA', 'COCHAMÓ', 'COCHRANE', 'CODEGUA', 'COELEMU', 'COIHUECO', 'COINCO', 'COLBÚN', 'COLCHANE ', 'COLINA', 'COLLIPULLI', 'COLTAUCO', 'COMBARBALÁ', 'CONCEPCIÓN', 'CONCHALÍ', 'CONCÓN', 'CONSTITUCIÓN', 'CONTULMO', 'COPIAPÓ', 'COQUIMBO', 'CORONEL', 'CORRAL', 'COYHAIQUE', 'CUNCO', 'CURACAUTÍN', 'CURACAVÍ', 'CURACO DE VÉLEZ URBANO', 'CURANILAHUE', 'CURARREHUE', 'CUREPTO', 'CURICÓ', 'DALCAHUE', 'DIEGO DE ALMAGRO', 'DOÑIHUE', 'EL BOSQUE', 'EL CARMEN', 'EL MONTE', 'EL QUISCO', 'EL TABO', 'EMPEDRADO', 'ERCILLA', 'ESTACIÓN CENTRAL', 'FLORIDA', 'FREIRE', 'FREIRINA', 'FRESIA', 'FRUTILLAR', 'FUTALEUFÚ', 'FUTRONO', 'GALVARINO', 'GENERAL LAGOS ', 'GORBEA', 'GRANEROS', 'GUAITECAS', 'HIJUELAS', 'HUALAIHUÉ', 'HUALAÑÉ', 'HUALPÉN', 'HUALQUI', 'HUARA', 'HUASCO', 'HUECHURABA', 'ILLAPEL', 'INDEPENDENCIA', 'IQUIQUE', 'ISLA DE MAIPO', 'ISLA DE PASCUA', 'JUAN FERNÁNDEZ ', 'LA CALERA', 'LA CISTERNA', 'LA CRUZ', 'LA ESTRELLA ', 'LA FLORIDA', 'LA GRANJA', 'LA HIGUERA', 'LA LIGUA', 'LA PINTANA', 'LA REINA', 'LA SERENA', 'LA UNIÓN', 'LAGO RANCO', 'LAGO VERDE', 'LAGUNA BLANCA ', 'LAJA', 'LAMPA', 'LANCO', 'LAS CABRAS', 'LAS CONDES', 'LAUTARO', 'LEBU', 'LICANTÉN', 'LIMACHE', 'LINARES', 'LITUECHE', 'LLAILLAY', 'LLANQUIHUE', 'LO BARNECHEA', 'LO ESPEJO', 'LO PRADO', 'LOLOL', 'LONCOCHE', 'LONGAVÍ', 'LONQUIMAY', 'LOS ALAMOS', 'LOS ANDES', 'LOS ANGELES', 'LOS LAGOS', 'LOS MUERMOS', 'LOS SAUCES', 'LOS VILOS', 'LOTA', 'LUMACO', 'MACHALÍ', 'MACUL', 'MÁFIL', 'MAIPÚ', 'MALLOA', 'MARCHIHUE', 'MARÍA ELENA', 'MARÍA PINTO', 'MARIQUINA', 'MAULE', 'MAULLÍN', 'MEJILLONES', 'MELIPEUCO', 'MELIPILLA', 'MOLINA', 'MONTE PATRIA', 'MOSTAZAL', 'MULCHÉN', 'NACIMIENTO', 'NANCAGUA', 'NATALES', 'NAVIDAD', 'NEGRETE', 'NINHUE', 'NOGALES', 'NUEVA IMPERIAL', 'ÑIQUÉN', 'ÑUÑOA', 'OHIGGINS', 'OLIVAR', 'OLLAGÜE', 'OLMUÉ', 'OSORNO', 'OVALLE', 'PADRE HURTADO', 'PADRE LAS CASAS', 'PAIHUANO', 'PAILLACO', 'PAINE', 'PALENA', 'PALMILLA', 'PANGUIPULLI', 'PANQUEHUE', 'PAPUDO', 'PAREDONES', 'PARRAL', 'PEDRO AGUIRRE CERDA', 'PELARCO', 'PELLUHUE', 'PEMUCO', 'PENCAHUE', 'PENCO', 'PEÑAFLOR', 'PEÑALOLÉN', 'PERALILLO', 'PERQUENCO', 'PETORCA', 'PEUMO', 'PICA', 'PICHIDEGUA', 'PICHILEMU', 'PINTO', 'PIRQUÉ', 'PITRUFQUÉN', 'PLACILLA', 'PORTEZUELO', 'PORVENIR', 'POZO ALMONTE', 'PRIMAVERA', 'PROVIDENCIA', 'PUCHUNCAVÍ', 'PUCÓN', 'PUDAHUEL', 'PUENTE ALTO', 'PUERTO MONTT', 'PUERTO OCTAY', 'PUERTO VARAS', 'PUMANQUE', 'PUNITAQUI', 'PUNTA ARENAS', 'PUQUELDÓN', 'PURÉN', 'PURRANQUE', 'PUTAENDO', 'PUTRE', 'PUYEHUE', 'QUEILÉN', 'QUELLÓN', 'QUEMCHI', 'QUILACO', 'QUILICURA', 'QUILLECO', 'QUILLÓN', 'QUILLOTA', 'QUILPUÉ', 'QUINCHAO', 'QUINTA DE TILCOCO', 'QUINTA NORMAL', 'QUINTERO', 'QUIRIHUE', 'RANCAGUA', 'RANQUIL', 'RAUCO', 'RECOLETA', 'RENAICO', 'RENCA', 'RENGO', 'REQUÍNOA', 'RETIRO', 'RINCONADA', 'RÍO BUENO', 'RÍO CLARO', 'RÍO HURTADO', 'RÍO IBÁÑEZ', 'RÍO NEGRO', 'RÍO VERDE', 'ROMERAL', 'SAAVEDRA', 'SALAMANCA', 'SAGRADA FAMILIA', 'SAN ANTONIO', 'SAN BERNARDO', 'SAN CARLOS', 'SAN CLEMENTE', 'SAN ESTEBAN', 'SAN FABIÁN', 'SAN FELIPE', 'SAN FERNANDO', 'SAN GREGORIO', 'SAN IGNACIO', 'SAN JAVIER', 'SAN JOAQUÍN', 'SAN JOSÉ DE MAIPO', 'SAN JUAN DE LA COSTA', 'SAN MIGUEL', 'SAN NICOLÁS', 'SAN PABLO', 'SAN PEDRO', 'SAN PEDRO DE ATACAMA', 'SAN PEDRO DE LA PAZ', 'SAN RAFAEL', 'SAN RAMÓN', 'SAN ROSENDO', 'SAN VICENTE', 'SANTA BÁRBARA', 'SANTA CRUZ', 'SANTA JUANA', 'SANTA MARÍA', 'SANTIAGO', 'SANTO DOMINGO', 'SIERRA GORDA', 'TALAGANTE', 'TALCA', 'TALCAHUANO', 'TALTAL', 'TEMUCO', 'TENO', 'TEODORO SCHMIDT', 'TIERRA AMARILLA', 'TILTIL', 'TIMAUKEL', 'TIRÚA', 'TOCOPILLA', 'TOLTÉN', 'TOMÉ', 'TORRES DEL PAINE', 'TORTEL', 'TRAIGUÉN', 'TREGUACO', 'TUCAPEL', 'VALDIVIA', 'VALLENAR', 'VALPARAÍSO', 'VICHUQUÉN ', 'VICTORIA', 'VICUÑA', 'VILCÚN', 'VILLA ALEGRE', 'VILLA ALEMANA', 'VILLARRICA', 'VIÑA DEL MAR', 'VITACURA', 'YERBAS BUENAS', 'YUMBEL', 'YUNGAY', 'ZAPALLAR']
GENEROS = ['M','F']
INTERREGIONALS = ['No','Si']
DVS = ['1','2','3','4','5','6','7','8','9','0','K']
AREAS_TRABAJO = [
'Mantención de sistemas',
'Labores productivas',
'Labores operativas',
'Labores logísticas',
'Seguridad',
'Limpieza y sanitización']
PERIODOS = [
# 'P01 SEMANA => [Jueves 18 marzo a Viernes 19 marzo] (2 dias) Hora Corte: Miercoles 17 marzo 16:00',
# 'P02 FIN DE SEMANA => [Sabado 20 marzo a Domingo 21 marzo] (2 dias) Hora Corte: Viernes 19 marzo 16:00',
# 'P03 SEMANA => [Lunes 22 marzo a Viernes 26 marzo] (5 dias) Hora Corte: Viernes 19 marzo 16:00',
# 'P03.5 SEMANA => [Jueves 25 marzo a Viernes 26 marzo] (2 dias) Hora Corte: Miércoles 24 marzo 16:00',
# 'P04 FIN DE SEMANA => [Sabado 27 marzo a Domingo 28 marzo] (2 dias) Hora Corte: Viernes 26 marzo 16:00',
# 'P05 SEMANA => [Lunes 29 marzo a Viernes 2 abril] (5 dias) Hora Corte: Viernes 26 marzo 16:00']
# 'P06 FIN DE SEMANA => [Sabado 3 abril a Domingo 4 abril] (2 dias) Hora Corte: Viernes 2 abril 16:00',
# 'P07 SEMANA => [Lunes 5 abril a Viernes 9 abril] (5 dias) Hora Corte: Viernes 2 abril 16:00']
# 'P08 FIN DE SEMANA => [Sabado 10 abril a Domingo 11 abril] (2 dias) Hora Corte: Viernes 9 abril 16:00',
# 'P09 SEMANA => [Lunes 12 abril a Viernes 16 abril] (5 dias) Hora Corte: Viernes 9 abril 16:00']
'P10 FIN DE SEMANA => [Sabado 17 abril a Domingo 18 abril] (2 dias) Hora Corte: Jueves 15 abril 16:00',
'P11 SEMANA => [Lunes 19 abril a Viernes 23 abril] (5 dias) HHora Corte: Jueves 15 abril 16:00',
'P12 FIN DE SEMANA => [Sabado 24 abril a Domingo 25 abril] (2 dias) Hora Corte: Jueves 22 abril 16:00',
'P13 SEMANA => [Lunes 26 abril a Viernes 30 abril] (5 dias) Hora Corte: Jueves 22 abril 16:00',]

FECHAS_CORTE = { 'P12' => Time.new(2021, 4, 22, 16, 0, 0, '-04:00'), 'P13' => Time.new(2021, 4, 22, 16, 0, 0, '-04:00')  }

validates :nombres, :apellido1, :numdoc, :dv,
:fechanac, :domicilio, :mail, :role, presence: true
validates :periodo, inclusion: PERIODOS
validates :destino, inclusion: DESTINOS
validates :tipodoc, inclusion: TIPODOCS
validates :paisdoc, inclusion: PAISDOCS
validates :comuna, inclusion: COMUNAS
validates :genero, inclusion: GENEROS
validates :interregional, inclusion: INTERREGIONALS
validates :dv, inclusion: DVS
validates :area_trabajo, inclusion: AREAS_TRABAJO
validates :numdoc, numericality: true
validates :numdoc, length: { minimum: 7, maximum: 8 }
validates :numdoc, uniqueness: { scope: :periodo }


def periodo_str;periodo[0..2] if periodo;end
def fecha_corte
  FECHAS_CORTE[periodo_str] || Time.new(2021, 4, 9, 16, 0, 0, '-04:00')
end

NEW_MODE_DATE = Time.new(2021, 4, 13) 
def status
  return 'PERIODO CERRADO' if created_at < NEW_MODE_DATE
  return 'FECHA CORTE NO HA LLEGADO' if fecha_corte > Time.now
  return 'DISPONIBLE PARA DESCARGA' if patente.present?
  'PENDIENTE EN PROCESO'
end

def status_color
  sstr = status[0..3]
  { 'PERI' => 'black', 'FECH' => 'green', 'DISP' => 'blue', 'PEND' => 'red' }[sstr]
end

def ofuscate str
  return str if str.to_s.length < 4
  str[0..1] + (['*']*(str.length - 4)).join + str[-2..-1]
end

def ofuscate_end(str, show_n)
  str = str.to_s
  return str if str.length < show_n
  str[0...show_n] + (['*']*(str.length - show_n)).join
end

def truncate_end(str, show_n)
  str = str.to_s
  return str if str.length < show_n
  str[0...show_n] + '...'
end

def public_numdoc;ofuscate_end(numdoc, 5);end
def public_nombres;truncate_end(nombres, 3);end
def public_apellido1;truncate_end(apellido1, 3);end
def public_created_at;created_at.in_time_zone('Santiago').strftime("%d/%m/%Y %H:%M:%S");end

def gurl1;"https://drive.google.com/open?id=#{patente}";end
def gurl2;"https://drive.google.com/uc?export=download&id=#{patente}";end
def gurl3;"https://drive.google.com/file/d/#{patente}/view";end

# DEPRECATED
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

def to_csv
  [ id,
    created_at.in_time_zone('Santiago').strftime("%d/%m/%Y %H:%M:%S"),
    periodo,
    destino,
    nombres,
    apellido1,
    apellido2,
    tipodoc,
    paisdoc,
    numdoc,
    dv,
    fechanac.strftime("%d/%m/%Y"),
    domicilio,
    comuna,
    mail,
    genero,
    patente,
    role,
    'Si',
    interregional,
    area_trabajo
  ].join(';')
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
#  role          :string
#  area_trabajo  :string
#
