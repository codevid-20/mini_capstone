class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create]
  
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
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      image = Image.new(
        url: params[:image_url],
        product_id: @product.id
      )
      image.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      # render 'errors.json.jb', status: :unprocessable_entity
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
    def show
      @product = Product.find(params[:id])
      render 'show.json.jb'
    end
  end
