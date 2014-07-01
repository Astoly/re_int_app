class Reading < ActiveRecord::Base
	belongs_to :user
	belongs_to :request
	validates :content, presence: true
	validates :user_id, presence: true
	validates :request_id, presence: true
	has_many  :ratings
end
