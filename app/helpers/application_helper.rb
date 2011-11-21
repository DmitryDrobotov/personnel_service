module ApplicationHelper
  
  def user_full_name_link_to(user)
    link_to user.full_name, user_path(user) if user.present?
  end

  def java_not_available_error
    message = "<div class='alert-message error' data-alert='alert'>Web Service is not available now. Try later.<a href='#' class='close'>x</a></div>"
    escape_javascript(message.html_safe)
  end

end
