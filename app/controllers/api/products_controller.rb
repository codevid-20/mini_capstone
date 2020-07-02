class Api::ProductsController < ApplicationController
  def all
    # get all of the products
    @products = Product.all
    # end them to index.json.jb
    render 'index.json.jb'
  end

  def show_the_lamp
    @product = Product.first
    render 'the_lamp.json.jb'
  end

  def second_product
    @product = Product.second
    render 'the_lamp.json.jb'
  end

  def any
    product_name = params['product']
    @product = Product.find_by(name: product_name)
    render 'show.json.jb'
  end
end
