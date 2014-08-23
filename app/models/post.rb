class Post < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :categories

	def categories_list
	end

	def categories_list=(all_categories)
		return if all_categories.empty?
		all_categories.split(' ').uniq.each { |category| self.categories << Category.find_or_create_by(name: category) }
	end
end