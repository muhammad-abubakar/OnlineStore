class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :product,  index: true, foreign_key: true
      t.belongs_to :user,     index: true, foreign_key: true
      t.integer    :quantity, { default: 1}
      t.decimal    :price
      t.string     :comments

      t.timestamps null: false
    end
  end
end
