class CreateArt < ActiveRecord::Migration[5.1]
  def change
    create_table(:arts) do |t|
      t.column(:name, :string)
      t.column(:artist, :string)

      t.timestamps()
    end
  end
end
