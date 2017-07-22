class CreateArt < ActiveRecord::Migration[5.1]
  def change
    create_table(:arts) do |a|
      a.column(:name, :string)
      a.column(:artist, :string)

      a.timestamps()
    end
  end
end
