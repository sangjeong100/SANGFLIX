class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.decimal :rating, precision: 3, scale: 2, default: 0
      t.integer :return_status
      t.datetime :return_date

      t.timestamps
    end
  end
end
