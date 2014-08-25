class CategoriesController < ApplicationController

	def show
    filter = params[:post_id]
    @posts = Post.search(filter)
    @categories = Category.all
    @comment = Comment.new
    render '/posts/_show_posts'
	end

end
