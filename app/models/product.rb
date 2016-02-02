class Product < ActiveRecord::Base

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products

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

  def get_first_image
    if images.first
      images.first.url 
    else
      "http://images.media-allrecipes.com/userphotos/250x250/2289556.jpg"
    end
  end

end
