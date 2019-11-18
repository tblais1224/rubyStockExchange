class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.string :symbol
      t.integer :shares
      t.float :price
      t.float :total
      t.string :buy_sell_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
