class Technology < ApplicationRecord
    has_many :items
    accepts_nested_attributes_for :items, reject_if: lambda { |attrs| attrs['name'].blank? }
    enum status: {draft: 0, published: 1}

    validates_presence_of :title, :body, :thumb_image, :main_image 

    mount_uploader :thumb_image, TechnologyUploader
    mount_uploader :main_image, TechnologyUploader
    
    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= "https://via.placeholder.com/600x400.png?%20C/O%20https://placeholder.com/"
        self.thumb_image ||= "https://via.placeholder.com/350x200.png?%20C/O%20https://placeholder.com/"     
    end

end
