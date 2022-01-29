class Post < ApplicationRecord

    extend FriendlyId
    friendly_id :title, use: :slugged

    mount_uploader :image, PostUploader

    enum status: {draft: 0, published: 1}

    validates_presence_of :title, :body 

end
