class Product < ActiveRecord::Base

  belongs_to :supplier

  def sale_message
    if price.to_f < 2
      "Discount Item!!"
    else 
      "On Sale!!"
    end
  end

  def sales_tax
    price.to_f * 0.09
  end

  def total
    price.to_f + sales_tax
  end

end
