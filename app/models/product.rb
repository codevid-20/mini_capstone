class Product < ApplicationRecord
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
