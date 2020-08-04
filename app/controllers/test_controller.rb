class TestController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @courses = @current_user.teacher.courses
  end

  def create
    # @test = Testdb.new(test_params)
    # @exercise = Exercise.new(exercise_params)
    session[:test] = params[:test] unless params[:test].nil?
    # session[:test]['finishDate'] = DateTime.parse(session[:test]['finishDate'])
    # session[:test]['startDate'] = DateTime.parse(session[:test]['startDate'])
    unless params[:select].nil?
      if session[:test]['startDate'] >= session[:test]['finishDate']
        flash[:danger] = 'Your finish time must greater than start time'

        redirect_to action: :index
      else
        if params[:select] == '0'
          redirect_to action: :list
        else
          redirect_to action: :createTest
        end
      end
    end
  end

  def createTest


  end

  def postAvailableTest
    unless params[:id].nil?
      oldtest = Testdb.find(params[:id])
      exercises = oldtest.exercises
      test = Testdb.create(startTime: session[:test]['startDate'], finishTime: session[:test]['finishDate'], description: session[:test]['description'], teacher_id: @current_user.UserID,
                           course_id: session[:test]['ids'])
      exercises.each do |e|
        TestExercise.create(testdb_id: test.id, exercise_id: e['ExerciseID'])
      end
      flash[:success] = 'Test has been created!'
      redirect_to teacher_index_path

    end
  end

  def postCustomTest

    if params[:question].nil?
      flash[:danger] = 'Test create failed!'
      redirect_to action: :index, controller: :teacher
    else
      #tao test object
      @test = Testdb.create(startTime: session[:test]['startDate'], finishTime: session[:test]['finishDate'],
                            description: '', teacher_id: @current_user.UserID,
                            course_id: session[:test]['ids'])

      @questions = params[:question]

      i = 0
      exercises = []
      @exercise = nil
      selects = []


      @questions.each do |q, v|
        #tao bai tap
        @exercise = Exercise.create(Question: v)
        exercises.push(@exercise)
        #tao lua chon

        (0..3).each { |j|
          unless params[:select][i.to_s][j.to_s].empty?
            @select = Selection.create(Content: params[:select][i.to_s][j.to_s], exercise_id: @exercise.ExerciseID)
            selects.push(@select)
          end
          next unless params[:rightselect][i.to_s].slice(7) == i.to_s

          if params[:rightselect][i.to_s].slice(10) == j.to_s
            @rightanswer = RightAnswer.create(exercise_id: @exercise.ExerciseID, selection_id: @select.SelectionId)

          end
        }
        #tao cau tra loi dung
        @testexercise = TestExercise.create(testdb_id: @test.id, exercise_id: @exercise.ExerciseID)
        i += 1
      end
      flash[:success] = 'Test has been created!'
      redirect_to action: :index, controller: :teacher
    end


  end

  def list

    @listTest = Testdb.all
  end

  def viewtest
    unless params[:id].nil?
      @test = Testdb.find(params[:id])
      unless @test.nil?
        exercises = @test.exercises
        @exercises = []
        exercises.each do |e|
          @exercise = []
          selection = Selection.where('exercise_id =?', e.id)
          @exercise.push(e, selection)
          @exercises.push(@exercise)
        end
      end
    end
  end

  def doTest

  end

  def getDoTest
    unless params[:id].nil?
      @test = Testdb.find(params[:id])
      session[:test] = @test
      @test_exercises = @test.test_exercises
      @exercises = []
      @test_exercises.each do |te|
        @exercise = []
        exercise = Exercise.find(te.exercise_id)
        selections = exercise.selections
        @exercise.push(exercise, selections)
        @exercises.push(@exercise)
      end
      session[:exercises] = @exercises
      # render json: @exercises[0][0]["Question"]
    end
  end

  def postDoTest
    unless params[:exercise].nil?
      session[:usertestanswers] = params[:exercise]
      @mark = 0
      @rightanswers = []
      params[:exercise].each do |k, v|
        rightanswerid = RightAnswer.where(exercise_id: k).first.selection_id

        if v.to_i == rightanswerid
          @mark += 1
        end
        @rightanswers.push(rightanswerid)
      end

      session[:rightanswer] = @rightanswers
      session[:mark] = @mark

      StudentTest.create(student_id: @current_user.UserID, testdb_id: session[:test]['id'],
                         mark: (@mark * 10))

    end
    redirect_to action: :showAnswer

  end

  def showAnswer
    # render json: session[:rightanswer]
  end

  private

  def test_params
    params.require(:testdb).permit :startTime, :finishTime
  end


end
