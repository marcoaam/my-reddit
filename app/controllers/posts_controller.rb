class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	
  def index
    if params[:user_id]
      @posts = User.find_by(id: params[:user_id]).posts
    else
  	  @posts = Post.all.reverse
    end
  end

  def new
  	@post = Post.new
  end

  def create
  	current_user.posts.create(params[:post].permit(:title, :url, :categories_list))
  	redirect_to '/posts'
  end

  def edit
    @post = Post.new(current_user.posts.find_by(id: params[:post_id]))
  end

end
