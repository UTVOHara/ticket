class AddImageToTicks < ActiveRecord::Migration[7.0]
  def change
    add_column :ticks, :image, :string
  end
end
