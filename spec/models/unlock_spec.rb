require 'rails_helper'

RSpec.describe Unlock, type: :model do
  describe 'Associations' do
    it { should belong_to(:exercise) }
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:exercise) }
  end

  describe 'Unlocking an exercise' do
    before :each do
      @user = create(:user)
      @exercise = create(:exercise)
      Unlock.unlock(@user, @exercise)
    end

    it 'unlocks a new exercise for a user' do
      expect(@user.exercises).to include @exercise
    end

    it 'sets the unlocked flag' do
      unlock = Unlock.find_by(user: @user, exercise: @exercise)
      expect(unlock.unlocked_at.class).to eq ActiveSupport::TimeWithZone
    end

    it 'does not create a new unlock' do
      expect(@user.unlocks.count).to eq 1
      Unlock.unlock(@user, @exercise)
      expect(@user.unlocks.count).to eq 1
    end
  end
end
