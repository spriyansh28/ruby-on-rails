module PageTitleEdit
    extend ActiveSupport::Concern
 
    included do
        before_action :set_title
    end
    
    def set_title
        @page_title = "Post Manager" 
    end
end 