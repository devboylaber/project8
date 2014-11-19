class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product, index: true
      t.references :order, index: true
      t.decimal :unit_price
      t.integer :quantity
      t.decimal :total_price
      t.integer :user_id

      t.timestamps
    end
  end
end
