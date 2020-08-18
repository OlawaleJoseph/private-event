module ApplicationHelper
  def nav_links_display
    out = ""
    if member_signed_in?
      link_to('Sign Out', destroy_member_session_path, method: :delete)
    else
      out << link_to('Sign In', new_member_session_path)
      out << ' | '
      out << link_to('Sign Up', new_member_registration_path)
      out.html_safe
    end
  end

  def display_prop(prop)
    prop if prop
  end
end
