class CoursesController < ApplicationController
	before_action :authenticate_user!, exist:[:show]
    before_action :get_course, only:[:show]
  def index
  end

  def new
  	@course = Course.new
  end

  def create
    if current_user.role == "Editor"
     @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to root_path
    else render 'new'
    end
    end
  end


  def show
  end



  private

  def course_params
  	params.require(:course).permit(:user_id, :title, :shortbody, :body, :start, :finish )
  end

  def get_course
    @course=Course.find(params[:id])
  end
end
