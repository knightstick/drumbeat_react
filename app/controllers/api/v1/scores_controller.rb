class Api::V1::ScoresController < BaseApiController
  actions :index, :show, :create, :update, :destroy

  def create
    @score = Score.new(
      user: current_user,
      exercise: Exercise.find(params[:exercise_id]),
      discipline: params[:score][:discipline],
      score: params[:score][:score]
    )
    create!
  end

  def permitted_params
    params.permit(score: [
      :score,
      :discipline,
      :user_id,
      :exercise_id
    ])
  end
end
