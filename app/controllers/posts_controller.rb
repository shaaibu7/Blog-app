class PostsController < ActionController::Base
  def index
    @posts = Post.all
  end
  
  def show
    puts params
  end
end