class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	
  def index
  	@posts = Post.all.reverse
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params[:post].permit(:title))
    @post.save
  	@post.url(params[:post].permit(:url))
  	redirect_to '/posts'
  end

end
