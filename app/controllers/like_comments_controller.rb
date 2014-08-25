class LikeCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		comment = Comment.find(params[:comment_id])
		comment.likes.find_or_create_by(user_id: current_user.id)
		redirect_to '/posts'
	end

	def destroy
		comment = Comment.find(params[:comment_id])
		if !comment.likes.find_by(user_id: current_user.id).nil?
			like = comment.likes.find_by(user_id: current_user.id)
			like.destroy
			redirect_to '/posts'
		else
			comment.dislikes.find_or_create_by(user_id: current_user.id)
			redirect_to '/posts'
		end

	end

end
