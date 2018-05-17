FactoryGirl.define do
  factory :student_application do
    association :student, :institution
  end
end
