require 'rails_helper'

RSpec.describe StudentApplication, type: :model do

  let(:student) { FactoryGirl.create(:student) }
  let(:institution) { FactoryGirl.create(:institution) }
  let(:application) { FactoryGirl.create(:student_application) }

  it 'is invalid without an institution_id' do
    application = StudentApplication.new(institution_id: nil)
    application.valid?
    expect(application.errors[:institution_id]).to include("can't be blank")
  end

  it { is_expected.to delegate_method(:name).to(:student).with_prefix }
  it { is_expected.to delegate_method(:graduation_date).to(:student).with_prefix }
  it { is_expected.to delegate_method(:name).to(:institution).with_prefix }
  it { is_expected.to delegate_method(:application_deadline).to(:institution).with_prefix }
end
