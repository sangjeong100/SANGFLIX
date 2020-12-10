ActiveAdmin.register ActorAppearMovie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :movie_id, :actor_id, :actor_role
  #
  # or
  #
  permit_params do
    permitted = [:movie_id, :actor_id, :actor_role]
    permitted
  end

  form do |f|
    f.inputs do
      f.input :movie_id, as: :select, collection: Movie.all.map {|movie| [movie.movie_name, movie.id]}
      f.input :actor_id, as: :select, collection: Actor.all.map {|actor| [actor.actor_name, actor.id]}
      f.input :actor_role, as: :select, collection: Actor::ACTOR_TYPE
    end
    f.actions
  end
  
end
