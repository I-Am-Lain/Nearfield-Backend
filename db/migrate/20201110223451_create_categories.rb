class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :ActiveGEO
      t.string :InactiveGEO
      t.string :DebrisGEO
      t.string :RocketBodyGEO
      t.string :ActiveHEO
      t.string :InactiveHEO
      t.string :DebrisHEO
      t.string :RocketBodyHEO
      t.string :ActiveLEO
      t.string :InactiveLEO
      t.string :DebrisLEO
      t.string :RocketBodyLEO
      
      t.timestamps
    end
  end
end
