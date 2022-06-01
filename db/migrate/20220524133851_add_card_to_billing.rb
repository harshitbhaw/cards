class AddCardToBilling < ActiveRecord::Migration[5.2]
  def change
    add_reference :billings, :card, foreign_key: true
  end
end
