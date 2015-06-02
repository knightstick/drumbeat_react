# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Associations' do
    it { should have_many(:scores).dependent(:destroy) }
    it { should have_many(:unlocks).dependent(:destroy) }
    it { should have_many(:exercises).through(:unlocks) }
  end

  describe 'Validations' do
    it { should_validate_length_of_string_attributes_for_described_class only: [:email] }
    it { should_have_a_valid_factory }
  end

  describe 'Unlocks' do
    it 'unlocks the first exercise automatically' do
      exercise = create(:exercise)
      user = User.create(attributes_for(:user))
      expect(user.exercises).to include exercise
    end
  end
end
