class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	
	has_attached_file :image, 
   :styles => {
      :original => ['1920x1680>', :jpg],
    }
    validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end