# == Schema Information
#
# Table name: scores
#
#  id          :integer          not null, primary key
#  score       :integer          default(0), not null
#  discipline  :string
#  user_id     :integer
#  exercise_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  validates :discipline, length: { maximum: 255 }
  validates :score, :user, :exercise, presence: true
end
