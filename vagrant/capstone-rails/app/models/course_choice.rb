class CourseChoice < ApplicationRecord
  has_and_belongs_to_many :student_information
end
