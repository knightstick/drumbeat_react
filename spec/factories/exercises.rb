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
    name "MyString"
image_url "MyString"
description "MyString"
  end

end
