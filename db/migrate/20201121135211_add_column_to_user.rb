class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :age, :integer
    add_column :users, :account_type, :integer
    add_column :users, :account_number, :string
    add_column :users, :total_monthly_order, :int, default: 0
    add_column :users, :plan_date, :datetime
    add_column :users, :address, :string
    add_column :users, :detailed_address, :string
    add_column :users, :zipcode, :string
  end
end
