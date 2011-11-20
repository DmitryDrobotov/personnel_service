module ApplicationHelper
  
  require 'base64'

  ApplicationHelper::JAVA_URL = "http://192.168.1.8:8084/PersonnelService/graphs.do"
  
  def user_full_name_link_to(user)
    link_to user.full_name, user_path(user) if user.present?
  end

  def java_url(params = {})
    params_string = params.blank? ? ("") : ("?" + params.to_query)
    url = ApplicationHelper::JAVA_URL + params_string
    escape_javascript Base64.encode64(url)
  end

  def java_not_available_error
    message = "<div class='alert-message error' data-alert='alert'>Web Service is not available now. Try later.<a href='#' class='close'>x</a></div>"
    escape_javascript(message.html_safe)
  end

end
