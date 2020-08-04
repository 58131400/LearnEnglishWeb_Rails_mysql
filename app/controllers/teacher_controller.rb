class TeacherController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def index
    @courses = @current_user.teacher.courses

  end
  
  def new
    @teacher = Teacher.new
    session[:userid] = params[:id]
  end

  def create
    @teacher = Teacher.new teacher_params
    @teacher.user_id = session[:userid]

    session.delete(:userid)

    User.transaction do
      Teacher.transaction do
        User.create(UserID: session[:user]['UserID'],
                    Name: session[:user]['Name'],
                    Email: session[:user]['Email'],
                    Phone: session[:user]['Phone'],
                    username: session[:user]['username'],
                    TypeUser: 1,
                    password_digest: session[:user]['password_digest'])

        unless @teacher.save
          flash[:danger] = 'Register failed!'
          redirect_to action: :new, controller: :teacher, id: @teacher.user_id
          return true
        end
      end
    end
    flash[:success] = 'Register success!'
    redirect_to logout_path

  end


  def addbook

    @books = Book.all

  end

  def postaddbook
    unless params[:student].nil?
      @student = Student.where('StudentCard = ? ', params[:student]['StudentCard']).first
      student_id = @student.user_id

      if student_id.nil?
        flash[:danger] = 'Sorry, Student Card not found!'
        redirect_to controller: 'teacher', action: 'addbook'
      else
        student = StudentBook.create(student_id: student_id, book_id: params[:student]['id'], process: 0)
        puts("student: #{student}")
        flash[:success] = 'Added book for student'
        redirect_to controller: 'teacher', action: 'index'
      end

    end
  end
  private
  def teacher_params
    params.require(:teacher).permit :DepartmentName, :TeacherCard
  end
end
