class Device < ApplicationRecord
  belongs_to :duser


  LUGAR_TRABAJO = [
    'Remoto (Home Office)',
    'CHC Casa Matriz Las Condes',
'CHC Oficina Edifcio ILC',
'CHC CD Lampa',
'CHC Salón Puerto Montt',
'CHC Salón Temuco',
'CHC Salón Concepción',
'CHC Salón Talca',
'CHC Salón Viña del Mar',
'CHC Salón La Serena',
'CHC Antofagasta',
'Delfin Planta Lampa',
'Delfin Puerto Montt',
'Delfin Curicó',
'Delfin Coquimbo',
'Otro'
  ]



  TIPOS_COMPUTADORES = [
    'All in One',
    'Notebook',
    'Mini PC',
    'Torre'
    ]

    def hdevtype
      case devtype
      when 'mobile'
        'Móvil'
      when 'pc'
        'PC'
      when 'monitor'
        'Monitor'
      when 'printer'
        'Impresora'
      when 'other'
        'Otro'
      else
        nil
      end
    end
end

# == Schema Information
#
# Table name: devices
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  duser_id   :bigint(8)
#  devtype    :string
#  subtype    :string
#  brand      :string
#  model      :string
#  color      :string
#  comments   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_devices_on_duser_id  (duser_id)
#
# Foreign Keys
#
#  fk_rails_...  (duser_id => dusers.id)
#
