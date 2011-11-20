module ApplicationHelper
  def user_full_name_link_to(user)
    link_to user.full_name, user_path(user) if user.present?
  end
end
