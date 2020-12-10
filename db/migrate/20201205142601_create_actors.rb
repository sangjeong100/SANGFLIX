class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :actor_name
      t.integer :age
      t.decimal :rating
      t.string :gender
      t.integer :movies_appeared_in

      t.timestamps
    end
  end
end
