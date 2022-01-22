module ApplicationHelper
    def authentication_helper style
        if current_user.is_a?(GuestUser) 
            (link_to "Log In", new_user_session_path, class: style ) +
            " ".html_safe +
            (link_to "Sign Up", new_user_registration_path, class: style ) 
        else 
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    def source_helper(layout_name)
        if session[:source]
            greeting = "Visited from  #{session[:source]}. You are on the #{layout_name}."
            content_tag(:p, greeting, class: "source-greeting")
        end 
    end
end
 