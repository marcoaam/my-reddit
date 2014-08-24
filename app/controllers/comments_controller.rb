class CommentsController < ApplicationController

	before_action :authenticate_user!

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		post = Post.find(params[:post_id])
		Comment.create(thoughts: params[:comment][:thoughts], user: current_user, post: post)
		redirect_to ('/posts')
	end

end
