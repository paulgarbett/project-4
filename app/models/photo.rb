class Photo < ActiveRecord::Base
	belongs_to :user
    has_attached_file :image, 
   		:styles => {
      :small    => ['100x100#',   :jpg],   
    }
    validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
