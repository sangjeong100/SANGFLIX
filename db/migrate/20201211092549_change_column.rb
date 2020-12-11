class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :rating, :decimal, :precision => 4, :scale => 2
    change_column :orders, :rating, :decimal, :precision => 4, :scale => 2
  end
end
