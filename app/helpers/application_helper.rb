module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      (link_to "Login", new_user_session_path, class: style)      
    else
      link_to "Edit Profile", (edit_user_registration_path), class: style
      link_to "Logout", (destroy_user_session_path), method: :delete, class: style
    end
  end
  def source_helper
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]}",
        class: "source-greeting")
    end 
  end
  
  def copyright_generator
    MjmViewTool::Renderer.copyright ' Matthew J Martin', 'All Rights Reserved'
  end
  def photo_credit_generator
    MjmViewTool::Renderer.photo_credit 'Paula Affatato'
  end

  def nav_helper style, tag_type
nav_links = <<NAV
<#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
<#{tag_type}><a href="#{about_path}" class="#{style} #{active? about_path}">About Me</a></#{tag_type}>
<#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog</a></#{tag_type}>
<#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolios</a></#{tag_type}>
<#{tag_type}><a href="#{tech_news_path}" class="#{style} #{active? tech_news_path}">Tech News</a></#{tag_type}>
NAV

    nav_links.html_safe
  end

  def active? (path)
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      js add_gritter(alert, title: '3JMCoding Portfolio', sticky: false)
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: '3JMCoding Portfolio', sticky: false)
  end

end
