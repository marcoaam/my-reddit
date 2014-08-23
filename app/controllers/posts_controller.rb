class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	
  def index
  	@posts = Post.all.reverse
  end

  def new
  	
  end

end
