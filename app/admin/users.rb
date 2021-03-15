ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :email, :password, :firstName, :lastName, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :firstName, :secondName, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: 'User' do |f|
    inputs  do
      input :email
      input :firstName
      input :lastName
      input :role
      input :password
    end
    f.actions
  end
end
