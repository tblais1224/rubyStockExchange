class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :symbol
      t.float :total
      t.string :name
      t.integer :shares
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
