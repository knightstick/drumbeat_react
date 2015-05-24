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

class Exercise < ActiveRecord::Base
  validates :name, :image_url, length: { maximum: 255 }
  validates :name, presence: true

  has_many :scores, dependent: :destroy
  has_many :users, through: :scores
end
