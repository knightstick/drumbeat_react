class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :description, :created_at, :updated_at
end
