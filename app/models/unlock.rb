class Unlock < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :user

  validates :user, :exercise, presence: true
  validates :exercise, uniqueness: { scope: :user_id }

  def self.unlock(user, exercise)
    unlock = self.initialize_unlock(user, exercise)
    unlock.save ? true : false
  end

  def self.unlock!(user, exercise)
    unlock = self.initialize_unlock(user, exercise)
    unlock.save! ? true : false
  end

  def self.unlock_initial_exercises(user)
    exercise = Exercise.first
    unlock(user, exercise)
  end

  private

  def self.initialize_unlock(user, exercise)
    unlock = Unlock.find_or_initialize_by(
      user: user,
      exercise: exercise)
    unlock.update(unlocked_at: Time.now)
    unlock
  end
end
