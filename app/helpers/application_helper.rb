module ApplicationHelper
  
  def dispaly_user
    logout_link = link_to 'Logout', logout_path, method: 'delete' 
    content_tag(:p, "Logged in as: #{current_user.name}. ") + logout_link 
  end
  
end
