# == Schema Information
#
# Table name: exercises
#
#  id          :integer          not null, primary key
#  name        :string           default(""), not null
#  image_url   :string
#  description :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :exercise do
    sequence(:name) { |n| "#{n} stroke roll"}
    sequence(:tier) { |n| n }
    image_url "http://example.com/image.jpg"
    description "A very cool rudiment to impress all the ladies"
  end

end
