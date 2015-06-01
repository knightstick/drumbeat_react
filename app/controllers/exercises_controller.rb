class ExercisesController < ApplicationController
  def index
    @exercises = ExercisesFacade.new(current_user)
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def unlocks
    # TODO: refactor into class method?
    # Maybe a Facade with tiers etc?
    all_exercises = Exercise.all
    @locked_exercises = all_exercises.select {|exercise| !current_user.exercises.include? exercise }
  end

  def unlock
    exercise = Exercise.find(params[:id])
    Unlock.unlock(current_user, exercise)
    redirect_to exercises_path
  end
end
