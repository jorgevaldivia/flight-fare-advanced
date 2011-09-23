RailsAdmin.config do |config|
  config.authenticate_with do 
  end
  config.authorize_with do 
    #redirect_to root_path unless current_user.try(:admin?)
  end
end
