class CreateActorAppearMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_appear_movies do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.string :actor_role

      t.timestamps
    end
  end
end
