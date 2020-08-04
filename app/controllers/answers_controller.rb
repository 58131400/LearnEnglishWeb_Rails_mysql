class AnswersController < ApplicationController
  def answer
    @part = Part.find(params[:id])
    @unit = Unit.find(@part.unit_id)
    @currentbook = Book.find(session[:current_book]['BookId'])
    @exerciseparts = ExercisePart.where('part_id = ?', @part.PartId)
    @exercises = []
    @exerciseparts.each do |ep|
      @exercise = Exercise.find(ep.exercise_id)
      @exercises.push(@exercise)
    end
    @array2 = []
    @exercises.each do |e|
      @selection = Selection.where('exercise_id =?', e.ExerciseID)
      @array = [] #mang cac lua chon cua 1 bt
      @array.push(e, @selection)
      #tat ca bt
      @array2.push(@array)
    end
    total = 0
    exercise = nil
    @rightAnswer = []
    partid = 0
    session[:userAnswers] = params[:exercise]
    params[:exercise].each { |k, v|
      rightAnswer = RightAnswer.where('exercise_id =?', k).first
      @rightAnswer.push(rightAnswer)

      total += 1 if rightAnswer.selection_id == v.to_i
    }
    studentpart = Studentpart.where('student_id = ? and part_id =?', @current_user.UserID, @part.PartId).first

    @mark = ((total * 10).to_s + '/' + (@part.NumberQuestion * 10).to_s)
    if !studentpart.nil?
      @current_user.student.update_attribute(:point, @current_user.student.point - studentpart.mark)
      studentpart.update_attribute(:mark, total * 10)
      @current_user.student.update_attribute(:point, @current_user.student.point + studentpart.mark)
    else
      Studentpart.create(student_id: @current_user.UserID, partid: @part.PartID, mark: total * 10)
      @current_user.student.update_attribute(:point, @current_user.student.point + total * 10)
    end

    #update process student course
    @units = @currentbook.units
    totalquestion = 0
    totalrightanswer = 0
    @units.each do |u|
      @parts = u.Parts
      @parts.each do |p|
        totalquestion += p.NumberQuestion
        sp = Studentpart.where('student_id = ? and part_id =?', @current_user.UserID, p.PartId).first
        totalrightanswer += sp.mark / 10 unless sp.nil?
        puts "part #{p.PartId}"
        puts "part numberquestion #{p.NumberQuestion}"
        puts "totalright answer #{totalrightanswer}"

        puts "total question: #{totalquestion}"
      end
    end
    studentcourse = StudentCourse.where('student_id = ? and course_id =?', @current_user.UserID, session[:current_course]['course_id']).first

    studentcourse.update_attribute(:process, (totalrightanswer * 1.0 / totalquestion))
  end


end
