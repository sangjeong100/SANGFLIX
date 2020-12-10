class AddMovieDescriptionToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :movie_description, :text
  end
end
