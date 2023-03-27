class Airport < ApplicationRecord
  validates :airport_code, presence: :true
end
