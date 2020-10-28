class Api::ProductsController < ApplicationController
  def all
    @products = Product.all
    render "all.json.jb"
  end

  def ring
    @ring = Product.find_by(name: "ring")
    render "ring.json.jb"
  end

  def watch
    @watch = Product.find_by(name: "watch")
    render "watch.json.jb"
  end

  def earrings
    @earrings = Product.find_by(name: "earrings")
    render "earrings.json.jb"
  end
end
