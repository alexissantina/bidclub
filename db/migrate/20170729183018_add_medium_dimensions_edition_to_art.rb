class AddMediumDimensionsEditionToArt < ActiveRecord::Migration[5.1]
  def change
    add_column(:arts, :medium, :string)
    add_column(:arts, :width, :integer)
    add_column(:arts, :length, :integer)
    add_column(:arts, :edition, :integer)
  end
end
