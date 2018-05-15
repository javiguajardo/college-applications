puts '==> Filling in the /institutions/ table'

# Deletes all existing records.
Institution.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('institutions')

50.times do
  Institution.create(name: Faker::University::unique.name, location: Uscs.cities.sample,
                     application_deadline: Faker::Date.between(1.year.ago, Date.today), mascot: Faker::Dog.breed,
                     essay_prompt: Faker::Lorem.sentence, notes: Faker::Lorem.sentence)
end
