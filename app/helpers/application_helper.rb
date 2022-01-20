module ApplicationHelper
    def authentication_helper
        if current_user.is_a?(User) 
            link_to "Logout", destroy_user_session_path, method: :delete 
        else 
            (link_to "Log In", new_user_session_path ) +
            "<br>".html_safe +
            (link_to "Sign Up", new_user_registration_path) 
        end
    end

    def source_helper(layout_name)
        if session[:source]
            greeting = "Visited from  #{session[:source]}. You are on the #{layout_name}."
            content_tag(:p, greeting, class: "source-greeting")
        end 
    end
end
