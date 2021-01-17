class Buyinfo

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture, :city, :street, :building, :tel, :item_id, :user_id, :order_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ ,message: :invalid }  
    validates :city
    validates :street
    validates :tel
    validates :token
  end

    validates :prefecture, numericality: { other_than: 0 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture: prefecture, city:city, street: street, building: building, tel: tel, order_id: order.id)
  end

end
