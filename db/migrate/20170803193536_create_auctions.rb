class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table(:auctions) do |t|
      t.column(:name, :string)
      t.column(:date, :date)
      t.timestamps()
    end

    add_column(:arts, :auction_id, :integer)
  end
end
