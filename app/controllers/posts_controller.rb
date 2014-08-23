class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	
  def index
  	@posts = Post.all.reverse
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params[:post].permit(:text))
  	@post.save
  	redirect_to '/posts'
  end

end
