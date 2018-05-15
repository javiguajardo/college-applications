json.extract! student, :id, :name, :email, :phone_number, :date_of_birth, :graduation_date, :created_at, :updated_at
json.url student_url(student, format: :json)
