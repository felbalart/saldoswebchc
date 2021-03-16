class CreateSalvoconductos < ActiveRecord::Migration[5.2]
  def change
    create_table :salvoconductos do |t|
      t.string :periodo
      t.string :destino
      t.string :nombres
      t.string :apellido1
      t.string :apellido2
      t.string :tipodoc
      t.string :paisdoc
      t.string :numdoc
      t.string :dv
      t.date :fechanac
      t.string :domicilio
      t.string :comuna
      t.string :mail
      t.string :genero
      t.string :patente
      t.string :interregional

      t.timestamps
    end
  end
end
