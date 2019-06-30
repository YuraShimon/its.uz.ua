class PagesController < ApplicationController
  def index
  	@users = User.all
  	@posts = Post.all  	
    @courses = Course.all
  end
end
