module CurrentUserConcern
	extend ActiveSupport::Concern
	 def current_user
	 	super || guest_user
    end
    def guest_user
    	guest = OpenStruct.new
    	guest.first_name = "Guest"
    	guest.last_name = "User"
    	guest.email = "abc@xyz.com"
        guest
    end
end