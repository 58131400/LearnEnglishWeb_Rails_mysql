class UnitsController < ApplicationController

  def index
    @user = if session[:user].nil?
              @current_user.student
            else
              session[:user]
            end

    @unit = Unit.find(params[:id])

    @speaking = Part.where('unit_id = ? and typepart_id = 1', @unit.UnitID).first
    @speaking_hard_question = 0
    @speaking_medium_question = 0
    @speaking_easy_question = 0
    @speaking&.exercises&.each do |e|
      if e.level.eql?('hard')
        @speaking_hard_question += 1
      elsif e.level.eql?('medium')
        @speaking_medium_question += 1
        puts(@speaking_medium_question)
      else
        @speaking_easy_question += 1
        puts(@speaking_easy_question)
      end
    end

    @reading = Part.where('unit_id = ? and typepart_id = 2', @unit.UnitID).first
    @reading_hard_question = 0
    @reading_medium_question = 0
    @reading_easy_question = 0
    @reading&.exercises&.each do |e|
      if e.level.equal?('hard')
        @reading_hard_question += 1
      elsif e.level.equal?('medium')
        @reading_medium_question += 1
      else
        @reading_easy_question += 1
      end
    end

    @vocabualary = Part.where('unit_id = ? and typepart_id = 4', @unit.UnitID).first
    @vocabualary_hard_question = 0
    @vocabualary_medium_question = 0
    @vocabualary_easy_question = 0
    @vocabualary&.exercises&.each do |e|
      if e.level.equal?('hard')
        @vocabualary_hard_question += 1
      elsif e.level.equal?('medium')
        @vocabualary_medium_question += 1
      else
        @vocabualary_easy_question += 1
      end
    end

    @grammar = Part.where('unit_id = ? and typepart_id = 3', @unit.UnitID).first
    @grammar_hard_question = 0
    @grammar_medium_question = 0
    @grammar_easy_question = 0
    @grammar&.exercises&.each do |e|
      if e.level.equal?('hard')
        @grammar_hard_question += 1
      elsif e.level.equal?('medium')
        @grammar_medium_question += 1
      else
        @grammar_easy_question += 1
      end
    end

  end
end
