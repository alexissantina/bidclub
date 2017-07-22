class AddPrice < ActiveRecord::Migration[5.1]
  def change
      a.column(:arts, :price, :float)
      a.column(:arts, :purchased, :boolean)
  end
end
