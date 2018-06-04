class CreateStudentInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :student_informations do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob

      t.timestamps
    end
  end
end
