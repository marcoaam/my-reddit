class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	
  def index
    @categories = Category.all
    @comment = Comment.new
    if params[:user_id]
      @posts = User.find_by(id: params[:user_id]).posts.reverse
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
    @post = current_user.posts.find_by(id: params[:id])
  end

  def update
    post = current_user.posts.find_by(id: params[:id])
    post.update(params[:post].permit(:title, :url, :categories_list))
    redirect_to '/posts'
  end

  def destroy
    post = current_user.posts.find_by(id: params[:id])
    post.destroy
    redirect_to '/posts'
  end

  def show
    filter = params[:id].to_sym
    @posts = Post.send(filter)
    @comment = Comment.new
    @categories = Category.all
    render "show_posts"
  end

end
