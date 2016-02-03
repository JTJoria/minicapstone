class CartedProduct < ActiveRecord::Base

  belongs_to :product
  belongs_to :order
  belongs_to :user

  def calc_subtotal(price)
    price * quantity
  end

  def calc_tax(tax_rate)
    subtotal * tax_rate
  end

  def calc_total
    subtotal + tax
  end
  
end
