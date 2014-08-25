class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	has_many :likes
	has_many :dislikes

	def total_points
		self.likes.count - self.dislikes.count
	end
	
end