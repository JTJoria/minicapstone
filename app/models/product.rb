class Product < ActiveRecord::Base

  # validates :price, presence: true
  # validates :price, numericality: true
  # validates :price, greater_than_or_equal_to: %{0.01}
  # validates :name, format: { with: /\A[a-zA-Z]+\z/,
  #   message: "only allows letters" }
  # validates :name, 
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :name, length: { minimum: 3 }
  # validates :name, length: { maximum: 20 }
  # validates :supplier_id, presence: true
  # validates :supplier_id, numericality: true { only_integer: true }


  belongs_to :supplier
  has_many :images

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
