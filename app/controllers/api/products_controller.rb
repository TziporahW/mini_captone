class Api::ProductsController < ApplicationController
  def all
    @products = Product.all
    render "all.json.jb"
  end
end
