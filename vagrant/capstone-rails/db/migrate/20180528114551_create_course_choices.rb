class CreateCourseChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :course_choices do |t|
      t.string :course_name
      t.string :course_short, limit: 7

      t.timestamps
    end
  end
end
