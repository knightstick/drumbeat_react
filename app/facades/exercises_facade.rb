class ExercisesFacade
  attr_reader :user, :tiers, :exercises

  def initialize(user)
    @user = user
  end

  def exercises
    @exercises ||= user.exercises
  end

  def tiers
    @tiers ||= user.exercises.map(&:tier).uniq.sort
  end

  def exercises_for_tier(tier)
    exercises.where(tier: tier)
  end
end