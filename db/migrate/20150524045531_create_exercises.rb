class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name,       null: false, default: ""
      t.string :image_url
      t.text :description,  null: false, default: ""

      t.timestamps null: false
    end
  end
end
