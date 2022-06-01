class AddDetailsToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :name, :string
    add_column :cards, :card_number, :integer
    add_column :cards, :cvv, :integer
    add_column :cards, :valid_from, :date
    add_column :cards, :valid_thru, :date
  end
end
