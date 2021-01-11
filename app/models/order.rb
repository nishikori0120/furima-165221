class Order < ApplicationRecord
  belongs_to :items
  # has_one :addresses
end
