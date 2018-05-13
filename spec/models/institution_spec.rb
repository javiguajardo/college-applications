require 'rails_helper'

RSpec.describe Institution, type: :model do
  it 'is invalid without a name' do
    institution = Institution.new(name: nil)
    institution.valid?
    expect(institution.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    FactoryGirl.create(:institution)
    institution_2 = Institution.new(name: 'university of california, los angeles')
    institution_2.valid?
    expect(institution_2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid without a location' do
    institution = Institution.new(location: nil)
    institution.valid?
    expect(institution.errors[:location]).to include("can't be blank")
  end

  it 'is invalid without an application deadline' do
    institution = Institution.new(application_deadline: nil)
    institution.valid?
    expect(institution.errors[:application_deadline]).to include("can't be blank")
  end

  it 'is invalid with an application deadline without this format yyyy-mm-dd' do
    institution = Institution.new(application_deadline: '12345')
    institution.valid?
    expect(institution.errors[:application_deadline]).to include("can't be blank")
  end
end
