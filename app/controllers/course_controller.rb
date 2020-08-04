class CourseController < ApplicationController

  def index
    #danh sach sinh vien

    @course = Course.find(params[:id])
    @students = @course.students
    @teachers = @course.teachers
  end

  def newmanage
    @books = Book.all
    @teachers = User.where('TypeUser = 1')
  end

  def create
    unless params[:course].nil?
      @course = Course.new course_params
      @course.course_level = params[:level]


      teacher_ids = params[:User]['UserID']
      # xoa id blank
      teacher_ids = teacher_ids.reject { |e| e.to_s.empty? }

      Course.transaction do

        CourseManagement.transaction do
          @course.save
          teacher_ids.each do |t|
            CourseManagement.create(course_id: @course.course_id, teacher_id: t)
          end

        end
      end

      flash[:success] = 'Added 1 class to manage!'
      redirect_to teacher_index_path
    end

  end

  def join_course
    course = Course.find(params[:id])
    student_course = course.student_courses.where('student_id = ?',@current_user.UserID).first
    if course.start_time < DateTime.now and student_course.nil?
      StudentCourse.transaction do
        StudentCourse.create(student_id: @current_user.UserID,
                             course_id: course.course_id)

      end
    end

    redirect_to action: :index, controller: :students
  end

  def learn
    session[:current_course] = Course.find(params[:id])
    redirect_to action: :index, controller: :books, id: session[:current_course]['book_id']
  end
  private

  def course_params
    params.require(:course).permit(:course_id, :name, :description, :start_time, :finish_time,
                                   :book_id)
  end


end
