class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :title
      t.string :shortbody
      t.string :body
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
