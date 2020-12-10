class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.string :movie_type
      t.integer :age_limit
      t.decimal :rating
      t.integer :number_of_copies

      t.timestamps
    end
  end
end
