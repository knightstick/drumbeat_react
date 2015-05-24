class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :score, :discipline, :user_id, :exercise_id, :created_at, :updated_at
end
