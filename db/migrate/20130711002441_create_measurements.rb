class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
