class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	
  def index
  	@posts = Post.all.reverse
  end

  def new
  	@post = Post.new
  end

  def create
  	current_user.posts.create(params[:post].permit(:title, :url, :categories_list))
  	redirect_to '/posts'
  end

end
