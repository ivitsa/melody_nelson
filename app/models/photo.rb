class Photo < ActiveRecord::Base
	has_attached_file :image, 
		:styles => {:large => "x450", :small => "150x150>"}
		#:url => '/images/gallery/:id/:style/:basename.:extension',
		#:path => ':rails_root/public/images/gallery/:id/:style/:basename.:extension'
	
	validates :position, presence: true
	validates_attachment_presence :image
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
	validates_attachment_size :image, :less_than =>  5.megabytes
end
