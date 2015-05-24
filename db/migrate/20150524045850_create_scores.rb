class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score,       null: false, default: 0
      t.string :discipline
      t.references :user,     index: true
      t.references :exercise, index: true

      t.timestamps            null: false
    end
    add_foreign_key :scores, :users
    add_foreign_key :scores, :exercises
  end
end
