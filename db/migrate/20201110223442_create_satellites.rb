class CreateSatellites < ActiveRecord::Migration[6.0]
  def change
    create_table :satellites do |t|
      t.string :name
      t.integer :color
      t.string :satellite_number
      t.string :international_designator
      t.string :owner
      t.integer :category_id
      t.string :mission
      t.string :launch_date
      t.string :launch_site
      t.string :period
      t.string :perigree
      t.string :apogee
      t.string :inclination
      t.float :x_coor
      t.float :y_coor
      t.float :z_coor

      t.timestamps
    end
  end
end
