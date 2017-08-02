class ChangeLengthToHeight < ActiveRecord::Migration[5.1]
  def change
     rename_column :arts, :length, :height
  end
end
