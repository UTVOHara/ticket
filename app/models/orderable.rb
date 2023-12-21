class Orderable < ApplicationRecord
  belongs_to :tick
  belongs_to :cart
  def total
    tick.price * quantity
  end
end
