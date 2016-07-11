class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :unit_price
      t.integer :quantity, {default: 0}
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :products
  end
end
