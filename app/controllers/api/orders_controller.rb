class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: 90,
      tax: 8.10,
      total: 98.10
    )
    @order.save
    render 'show.json.jb'
  end
end
