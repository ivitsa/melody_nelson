class Event < ActiveRecord::Base
	has_attached_file :image,
		:styles => {:medium => "x140"}
		#:url => '/images/events/:id/:style/:basename.:extension',
		#:path => ':rails_root/public/images/events/:id/:style/:basename.:extension'
		
	validates :headline, presence: true
	validates :time, presence: true
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
	validates_attachment_size :image, :less_than =>  5.megabytes
end
