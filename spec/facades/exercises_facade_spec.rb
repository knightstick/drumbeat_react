require 'rails_helper'

RSpec.describe 'exercises facade', type: :model do
  before :each do
    @user = create(:user)
    @exercise = create(:exercise, tier: 1)
    @user.unlocks << create(:unlock, user: @user, exercise: @exercise)
    @not_unlocked = create(:exercise)
  end

  it 'gets the unlocked exercises' do
    expect(ExercisesFacade.new(@user).exercises).to include @exercise
  end

  it 'does not get locked exercises' do
    expect(ExercisesFacade.new(@user).exercises).not_to include @not_unlocked
  end

  it 'includes the tiers' do
    difficult_exercise = create(:exercise, tier: 5)
    @user.exercises << difficult_exercise
    expect(ExercisesFacade.new(@user).tiers).to eq [1,5]
  end

  it 'includes each tier only once' do
    first_tier_2 = create(:exercise, tier: 1)
    @user.exercises << first_tier_2
    expect(ExercisesFacade.new(@user).tiers).to eq [1]
  end

  it 'can get all exercises for a tier' do
    expect(ExercisesFacade.new(@user).exercises_for_tier(1)).to include @exercise
  end
end