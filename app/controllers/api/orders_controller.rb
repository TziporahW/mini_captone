class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
    )
    @order.save
    @order.subtotal = @order.product.price * @order.quantity
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax
    @order.save
    render json: { message: "order successfully placed!" }
  end

  def index
    @orders = Order.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def show
    @order = Order.find_by(id: params["id"])
    if @order.user_id == current_user.id
      render "show.json.jb"
    else
      render json: { error: "You cant view that order as it isnt yours!" }, status: :unauthorized
    end
  end
end
