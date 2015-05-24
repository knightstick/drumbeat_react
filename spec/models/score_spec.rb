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

require 'rails_helper'

RSpec.describe Score, type: :model do

  describe 'Associations' do
    it { should belong_to :exercise }
    it { should belong_to :user }
  end

  describe 'Validations' do
    it { should_validate_length_of_string_attributes_for_described_class }
    it { should_have_a_valid_factory }
    it { should validate_presence_of :user }
    it { should validate_presence_of :exercise }
    it { should validate_presence_of :score }
  end
end
