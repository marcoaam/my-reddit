class LikesController < ApplicationController

	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		if !find_post_dislike(post, current_user.id).nil?
			find_post_dislike(post, current_user.id).destroy
			redirect_to '/posts'
		else
			post.likes.find_or_create_by(user_id: current_user.id)
			redirect_to '/posts'
		end
	end

	def destroy
		post = Post.find(params[:post_id])
		if !post.likes.find_by(user_id: current_user.id).nil?
			post.likes.find_by(user_id: current_user.id).destroy
			redirect_to '/posts'
		else
			post.dislikes.find_or_create_by(user_id: current_user.id)
			redirect_to '/posts'
		end
	end

	def find_post_dislike(post, user_id)
		post.dislikes.find_by(user_id: user_id)
	end
end
