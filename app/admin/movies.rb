ActiveAdmin.register Movie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :movie_name, :movie_type, :age_limit, :rating, :number_of_copies, :image, :video
  #
  # or
  #
  permit_params do
    permitted = [:movie_name, :movie_type, :movie_description, :age_limit, :rating, :number_of_copies, :image, :video]
    # permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
  form do |f|
    f.inputs do
      f.input :movie_name
      f.input :movie_type, collection: Movie::MOVIE_TYPE
      f.input :movie_description
      f.input :age_limit
      f.input :rating
      f.input :number_of_copies
      f.input :image, as: :file
    end
    f.actions
  end
end
