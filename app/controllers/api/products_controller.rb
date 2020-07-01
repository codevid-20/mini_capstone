class Api::ProductsController < ApplicationController
  def all
    # get all of the products
    @products = Product.all
    # end them to index.json.jb
    render 'index.json.jb'
  end
end
