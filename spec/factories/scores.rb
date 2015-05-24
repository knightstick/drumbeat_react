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

FactoryGirl.define do
  factory :score do
    sequence(:score) {|n| n }
    discipline "bars_4"
    user
    exercise
  end
end
