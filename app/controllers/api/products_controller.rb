class Api::ProductsController < ApplicationController
  def index
    @products = Product.where("name LIKE ?", "%#{params[:search]}%")

    if params[:discount] == "true"
      @products = @products.where('price < 10')
    end

    if params[:sort] == "price" && params[:sort_order] == 'desc'
      @products = @products.order(:price => :desc)
    elsif params[:sort] == "price"
      @products = @products.order(:price)    
    else
      @products = @products.order(:id)
    end

    


    
    render 'index.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    if @product.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      # render 'errors.json.jb', status: :unprocessable_entity
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
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
