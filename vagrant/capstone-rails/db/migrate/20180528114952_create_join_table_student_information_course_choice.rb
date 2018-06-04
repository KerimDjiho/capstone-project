class CreateJoinTableStudentInformationCourseChoice < ActiveRecord::Migration[5.1]
  def change
    create_join_table :student_informations, :course_choices do |t|
      #t.index [:student_id, :course_id], name: 'my_index'
      t.index [:course_choice_id, :student_information_id], :name =>'Middlebase' 
    end
  end
end
