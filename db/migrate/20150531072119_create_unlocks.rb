class CreateUnlocks < ActiveRecord::Migration
  def change
    create_table :unlocks do |t|
      t.references :exercise, index: true
      t.references :user, index: true
      t.datetime :unlocked_at
    end
    add_foreign_key :unlocks, :exercises
    add_foreign_key :unlocks, :users
  end
end
