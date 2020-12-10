class CreateMovieQueues < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_queues do |t|
      t.references :user, null: false
      t.references :movie, null: false

      t.timestamps
    end
  end
end
