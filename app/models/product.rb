class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  def supplier
    Supplier.find_by(id: supplier_id)
  end
  
  # def hello 
  #   "say hello"  
  # end

  # is_discounted?
  def is_discounted?
    price < 10
  end

  # tax
  def tax
    price * 0.09
  end
  # total

  def total
    price + tax
  end
end
