class Key < ApplicationRecord
  belongs_to :device
  validates :code, length: { minimum: 4, maximum: 8 }
end
