class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 1..5000 }

  def is_discounted?
    price < 10
  end

  def tax
    @tax = price * 0.09
    return "$#{@tax}"
  end

  def total
    return price + @tax
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end
end
