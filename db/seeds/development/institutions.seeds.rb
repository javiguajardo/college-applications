puts '==> Filling in the /institutions/ table'

50.times do
  Institution.create(name: Faker::University::unique.name, location: Uscs.cities.sample,
                     application_deadline: Faker::Date.between(1.year.ago, Date.today), mascot: Faker::Dog.breed,
                     essay_prompt: Faker::Lorem.sentence, notes: Faker::Lorem.sentence)
end