class Product < ApplicationRecord
  # def hello 
  #   "say hello"  
  # end

  # is_discounted?
  def is_discounted?
    if price > 10
      return false
    else
      return true
    end
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
