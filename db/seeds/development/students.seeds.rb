puts '==> Filling in the /students/ table'

# Deletes all existing records.
Student.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('students')

i = 10

50.times do
  Student.create(name: Faker::Name.name, email: Faker::Internet.unique.email,
                 phone_number: "(123) 123 - 12#{i}",
                 date_of_birth: Faker::Date.between(50.years.ago, 20.years.ago),
                 graduation_date: Faker::Date.between(10.years.ago, Date.today))
  i += 1
end