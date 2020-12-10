ActiveAdmin.register Actor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :actor_name, :age, :rating, :gender, :movies_appeared_in
  #
  # or
  #
  permit_params do
    permitted = [:actor_name, :age, :rating, :gender, :movies_appeared_in]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
  
  form do |f|
    f.inputs do
      f.input :actor_name
      f.input :age
      f.input :rating
      f.input :gender
      f.input :movies_appeared_in
    end
    f.actions
  end

end
