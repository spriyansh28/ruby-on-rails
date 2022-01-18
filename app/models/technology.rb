class Technology < ApplicationRecord

    enum status: {draft: 0, published: 1}

    validates_presence_of :title, :body, :thumb_image, :main_image 


end
