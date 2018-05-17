puts '==> Filling in the /applications/ table'

# Deletes all existing records.
StudentApplication.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('student_applications')

after 'development:students', 'development:institutions' do
  StudentApplication.create(student_id: 3, institution_id: 6)
  StudentApplication.create(student_id: 4, institution_id: 8)
  StudentApplication.create(student_id: 8, institution_id: 10)
  StudentApplication.create(student_id: 8, institution_id: 2)
  StudentApplication.create(student_id: 5, institution_id: 22)
  StudentApplication.create(student_id: 1, institution_id: 1)
  StudentApplication.create(student_id: 1, institution_id: 6)
end
