class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  before_create :generate_order_number

  private

  def generate_order_number
    self.order_number = "PTT-#{1000 + Order.count + 1}"
  end
end