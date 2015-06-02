FactoryGirl.define do
  factory :unlock do
    exercise
    user
    unlocked_at Time.now
  end
end
