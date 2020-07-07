class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end
  
  # def all
  #   # get all of the products
  #   @products = Product.all
  #   # end them to index.json.jb
  #   render 'index.json.jb'
  # end

  # def show_the_lamp
  #   @product = Product.first
  #   render 'the_lamp.json.jb'
  # end

  # def second_product
  #   @product = Product.second
  #   render 'the_lamp.json.jb'
  # end

  # def any
  #   # params = {"product"=>"7"}
    
    
  #   product_id = params['product']
  #   @product = Product.find_by(id: product_id)
  #   render 'show.json.jb'
  # end
end
