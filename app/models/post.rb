class Post < ActiveRecord::Base

	belongs_to :user
	has_and_belongs_to_many :categories
	has_many :comments
	has_many :likes
	has_many :dislikes

	validates :title, presence: true
	validates :url, presence: true

	def total_points
		self.likes.count - self.dislikes.count
	end

	def categories_list
	end

	def categories_list=(all_categories)
		return if all_categories.empty?
		all_categories.split(' ').uniq.each { |category| self.categories << Category.find_or_create_by(name: category) }
	end

	def self.newests
		self.all.sort_by { |post| post.created_at }.reverse
	end

	def self.hot
		posts_over_last_24_hours.sort_by { |post| post.likes.count }.reverse
	end

	def self.rising
		newests_posts_with_most_likes.sort_by { |post| post.created_at }.reverse
	end

	def self.controversial
		self.all.sort_by { |post| post.comments.count }.reverse
	end

	def self.top
		self.all.select { |post| post.likes.any? }.sort_by { |post| post.likes.count }.reverse
	end

	def self.posts_over_last_24_hours
		self.all.select { |post| (Time.now - post.created_at) < (3600 * 24) }
	end

	def self.newests_posts_with_most_likes
		self.newests.select { |post| post.likes.any? }.sort_by { |post| post.likes.count }
	end

	def self.search(category_name)
		category = Category.find_by(name: category_name)
		Post.all.select { |post| post.categories.include?(category) }
	end

end