module UsersHelper

  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://www.icons101.com/icons/15/Key_App_Icons__OS_X_by_noshery/128/Terminal.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
