class CreateTicks < ActiveRecord::Migration[7.0]
  def change
    create_table :ticks do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.datetime :time

      t.timestamps
    end
  end
end
