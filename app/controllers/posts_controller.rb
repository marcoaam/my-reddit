class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	
  def index
  	@posts = Post.all.reverse
  end

  def new
  	@post = Post.new
  end

  def create
    user = User.find(current_user)
  	user.posts.create(params[:post].permit(:title, :url))
  	redirect_to '/posts'
  end

end
