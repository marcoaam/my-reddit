class LikesController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		post.likes.create
		redirect_to '/posts'
	end

	def destroy
		post = Post.find(params[:post_id])
		post.likes.first.destroy
		redirect_to '/posts'
	end
end
