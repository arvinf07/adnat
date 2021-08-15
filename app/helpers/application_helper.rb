module ApplicationHelper
  
  def dispaly_user
    content_tag :p do 
      "Logged in as: #{current_user.name}. "  
      link_to 'Logout', logout_path, method: 'delete' 
    end
  end
  
end
