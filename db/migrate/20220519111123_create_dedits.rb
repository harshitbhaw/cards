class CreateDedits < ActiveRecord::Migration[5.2]
  def change
    create_table :dedits do |t|
      t.string :name
      t.integer :card_number
      t.integer :cvv
      t.date :valid_from
      t.date :valid_thru

      t.timestamps
    end
  end
end
