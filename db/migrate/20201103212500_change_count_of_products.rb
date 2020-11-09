class ChangeCountOfProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :count, :integer, default: 1
  end
end
