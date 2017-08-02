class AddPrice < ActiveRecord::Migration[5.1]
  def change
    add_column(:arts, :price, :float)
    add_column(:arts, :purchased, :boolean)
  end
end
