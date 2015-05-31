class ExercisesController < ApplicationController
  def index
    @exercises = ExercisesFacade.new(current_user)
  end

  def show
    @exercise = Exercise.find(params[:id])
  end
end
