class RenameMovieQueue < ActiveRecord::Migration[6.0]
  def change
    rename_table :movie_queues, :movie_queue
  end
end
