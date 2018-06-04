class StudentInformation < ApplicationRecord
  has_and_belongs_to_many :course_choice
end
