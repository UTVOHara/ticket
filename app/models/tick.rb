class Tick < ApplicationRecord
    has_many :orderables
  mount_uploader :image, ImageUploader
end
