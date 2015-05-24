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

require 'rails_helper'

RSpec.describe Exercise, type: :model do

  describe 'Associations' do
    it { should have_many(:scores).dependent(:destroy) }
    it { should have_many(:users).through(:scores)}
  end

  describe 'Validations' do
    it { should_validate_length_of_string_attributes_for_described_class }
    it { should_have_a_valid_factory }
    it { should validate_presence_of :name }
  end
end
