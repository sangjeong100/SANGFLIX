class AddTelphoneToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :telphone, :string
  end
end
