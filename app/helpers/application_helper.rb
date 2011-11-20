module ApplicationHelper
  
  ApplicationHelper::JAVA_URL = "http://192.168.1.8:8084/PersonnelService/graphs.do"
  
  def user_full_name_link_to(user)
    link_to user.full_name, user_path(user) if user.present?
  end

  def java_url(params = {})
    url = ApplicationHelper::JAVA_URL + "?" + params.to_query
    url.html_safe
  end

end
