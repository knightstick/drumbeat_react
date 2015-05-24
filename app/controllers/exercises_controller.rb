class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def show
    flash[:success] = 'Hello'
    @exercise = Exercise.find(params[:id])
  end
end
