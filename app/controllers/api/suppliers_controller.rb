class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end

  def show
    supplier_id = params["id"]
    @supplier = Supplier.find_by(id: supplier_id)
    render "show.json.jb"
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      phone_number: params[:phone_number],
      email: params[:email],
    )
    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    supplier_id = params["id"]
    @supplier = Supplier.find_by(id: supplier_id)

    @supplier.name = params["name"] || @supplier.name
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number
    @supplier.email = params["email"] || @supplier.email

    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    supplier_id = params["id"]
    supplier = Supplier.find_by(id: supplier_id)
    supplier.destroy
    render json: { message: "Your product was successfully deleted!" }
  end
end
