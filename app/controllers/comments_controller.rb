class CommentsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@post = Post.find_by(id: params[:post_id])
		@comment = Comment.new
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		post = Post.find(params[:post_id])
		Comment.create(thoughts: params[:comment][:thoughts], user: current_user, post: post)
		redirect_to :back
	end

end
