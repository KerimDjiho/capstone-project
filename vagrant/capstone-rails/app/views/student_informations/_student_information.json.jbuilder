json.extract! student_information, :id, :first_name, :last_name, :dob, :created_at, :updated_at
json.url student_information_url(student_information, format: :json)
