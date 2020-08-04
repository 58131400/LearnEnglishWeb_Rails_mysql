class ExerciseController < ApplicationController
  def index
    @part = Part.find(params[:id])
    @id = @part.PartId
    @exercisepart = ExercisePart.where("part_id = ?", @part.PartId)
    @exercise = []
    @exercisepart.each do |ep|
      @exercise.push(Exercise.find(ep.exercise_id))
    end
    @array2 = []
    @exercise.each do |e|
      @selection = Selection.where("exercise_id =?", e.ExerciseID)
      @array = [] #mang cac lua chon cua 1 bt
      @array.push(e, @selection)
      #tat ca bt
      @array2.push(@array)
    end

  end
end
