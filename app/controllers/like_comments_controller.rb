class LikeCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		comment = Comment.find(params[:comment_id])
		if !find_comment_dislike(comment, current_user.id).nil?
			find_comment_dislike(comment, current_user.id).destroy
			redirect_to :back
		else
			comment.likes.find_or_create_by(user_id: current_user.id)
			redirect_to :back
		end
	end

	def destroy
		comment = Comment.find(params[:comment_id])
		if !comment.likes.find_by(user_id: current_user.id).nil?
			comment.likes.find_by(user_id: current_user.id).destroy
			redirect_to :back
		else
			comment.dislikes.find_or_create_by(user_id: current_user.id)
			redirect_to :back
		end
	end

	def find_comment_dislike(comment, user_id)
		comment.dislikes.find_by(user_id: user_id)
	end

end
