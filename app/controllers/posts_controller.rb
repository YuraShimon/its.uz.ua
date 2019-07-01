class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_post, only: [:show,:edit,:update,:destroy]
  
  def new
  @post = Post.new
  end 

  def index
    

    @posts = Post.all
    #if @posts.any? 
    
  end

  def show
    @posts = Post.find(current_user.id)
  end

  def create
  @post = current_user.posts.build(post_params)
      #@post = current_user.build_post(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'new'
    end

  end
  
  def destroy
    @post.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:user_id,:title,:body)
  
    end

    def get_post
      @post = Post.find(params[:id])
    end
end
