class LikeCommentsController < ApplicationController
	
	before_action :authenticate_user!

	def create
		comment = Comment.find(params[:comment_id])
		comment.likes.create(user_id: current_user.id) if comment.likes.find_by(user_id: current_user.id).nil?
		redirect_to '/posts'
	end

	def destroy
		comment = comment.find(params[:comment_id])
		if !comment.likes.find_by(user_id: current_user.id).nil? && comment.likes.any?
			like = comment.likes.find_by(user_id: current_user.id)
			like.destroy
			redirect_to '/posts'
		elsif comment.likes.any?
			comment.likes.first.destroy
			redirect_to '/posts'
		else
			redirect_to '/posts'
		end
	end
end
