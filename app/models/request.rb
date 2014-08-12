class Request < ActiveRecord::Base
	belongs_to :user
	has_many :readings
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true
	validates :avatar, presence: true
	
	# Avatar uploader using carrierwave
  	mount_uploader :avatar, AvatarUploader

  	# Pagination
 	paginates_per 5

end