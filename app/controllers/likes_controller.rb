class LikesController < ApplicationController

	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		post.likes.find_or_create_by(user_id: current_user.id)
		redirect_to '/posts'
	end

	def destroy
		post = Post.find(params[:post_id])
		if !post.likes.find_by(user_id: current_user.id).nil?
			like = post.likes.find_by(user_id: current_user.id)
			like.destroy
			redirect_to '/posts'
		else
			post.dislikes.find_or_create_by(user_id: current_user.id)
			redirect_to '/posts'
		end
	end
end
