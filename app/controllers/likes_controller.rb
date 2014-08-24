class LikesController < ApplicationController

	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		post.likes.create(user_id: current_user.id) if post.likes.find_by(user_id: current_user.id).nil?
		redirect_to '/posts'
	end

	def destroy
		post = Post.find(params[:post_id])
		if !post.likes.find_by(user_id: current_user.id).nil? && post.likes.any?
			like = post.likes.find_by(user_id: current_user.id)
			like.destroy
			redirect_to '/posts'
		elsif post.likes.any?
			post.likes.first.destroy
			redirect_to '/posts'
		else
			redirect_to '/posts'
		end
	end
end