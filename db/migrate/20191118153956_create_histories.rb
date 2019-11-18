class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.string :symbol
      t.float :price
      t.float :total
      t.integer :shares
      t.references :user, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
