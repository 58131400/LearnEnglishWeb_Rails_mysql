class StudentsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @student = Student.new
    @classes = Classdb.all
    session[:userid] = params[:id]
  end

  def create
    @student = Student.new student_params
    @student.user_id = session[:userid]
    session.delete(:userid)
    User.transaction do
      Student.transaction do
        User.create(UserID: session[:user]['UserID'],
                    Name: session[:user]['Name'],
                    Email: session[:user]['Email'],
                    Phone: session[:user]['Phone'],
                    username: session[:user]['username'],
                    TypeUser: 2,
                    password_digest: session[:user]['password_digest'])

        if !@student.save
          flash[:danger] = 'Register failed!'
          redirect_to action: :new, controller: :students, id: @student.user_id
          return true
        end
      end
    end
    flash[:success] = 'Register successful!'
    redirect_to logout_path

  end

  def update
    student = current_user
  end

  def index
    @number_student = Student.count
    @number_teacher = Teacher.count
    @top_student = Student.order(point: :desc).limit(5)

    @user = current_user
    if @user.student.nil?
      @courses = nil
      student_course_id = nil
    else
      @courses = @user.student.courses
      student_course_id = @courses.select(:course_id)
    end


    @allcourses  = Course.where.not(course_id: student_course_id)
    # gan test = nil khi sinh vien da lam bai test
    @courses&.each do |c|
      @test = Testdb.where('course_id = ?  and finishTime >= ?', c.course_id, DateTime.now).first

            next if @test.nil?

            studenttest = StudentTest.where('student_id = ? and testdb_id =?', @user.UserID, @test.id).first

            if studenttest.nil?
              session[:test] = @test
            else
              # gan test = nil khi sinh vien da lam bai test
              @test = nil
            end

    end

  end

  private

  def student_params
    params.require(:student).permit :classdb_id, :StudentCard
  end
end
