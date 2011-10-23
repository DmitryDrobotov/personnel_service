module ApplicationHelper
  def full_name_link_to_user(user)
    link_to user.first_name + " " + user.last_name, user_path(user) if user.present?
  end
end
