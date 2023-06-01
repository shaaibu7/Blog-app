class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def destroy
     @user = User.find(params[:user_id])
     @post = @user.posts.find(params[:id])
     @post.destroy
     redirect_to user_posts_path(@user)
  end


  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.author = current_user

    if @post.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'Post created successfully'
    else
      render :new, notice: 'Post not created.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
