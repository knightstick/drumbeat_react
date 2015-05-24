class Api::V1::ScoresController < BaseApiController
  actions :index, :show, :create, :update, :destroy

  def permitted_params
    params.permit(score: [
      :score,
      :discipline,
      :user_id,
      :exercise_id
    ])
  end
end
