require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'is invalid without a name' do
    student = Student.new(name: nil)
    student.valid?
    expect(student.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an email' do
    student = Student.new(email: nil)
    student.valid?
    expect(student.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email' do
    FactoryGirl.create(:student)
    student_2 = Student.new(email: 'F.Javi.Guajardo@gmail.com')
    student_2.valid?
    expect(student_2.errors[:email]).to include("has already been taken")
  end

  it 'is invalid without an email with correct format' do
    student = Student.new(email: 'f.javi.guajardo@')
    student.valid?
    expect(student.errors[:email]).to include('is invalid')
  end

  it 'is invalid without a date of birth' do
    student = Student.new(date_of_birth: nil)
    student.valid?
    expect(student.errors[:date_of_birth]).to include("can't be blank")
  end

  it 'is invalid with a date of birth without this format yyyy-mm-dd' do
    student = Student.new(date_of_birth: '12345')
    student.valid?
    expect(student.errors[:date_of_birth]).to include("can't be blank")
  end

  it 'is invalid without a graduation date' do
    student = Student.new(graduation_date: nil)
    student.valid?
    expect(student.errors[:graduation_date]).to include("can't be blank")
  end

  it 'is invalid with a graduation date without this format yyyy-mm-dd' do
    student = Student.new(graduation_date: '12345')
    student.valid?
    expect(student.errors[:graduation_date]).to include("can't be blank")
  end

  it 'is invalid with a graduation date before date of birth' do
    student = Student.new(graduation_date: '2010-10-10', date_of_birth: '2018-05-13')
    student.valid?
    expect(student.errors[:graduation_date]).to include('must be after date of birth')
  end

  it 'is invalid with a duplicate phone number' do
    FactoryGirl.create(:student)
    student_2 = Student.new(phone_number: '(636) 109 - 3561')
    student_2.valid?
    expect(student_2.errors[:phone_number]).to include('has already been taken')
  end

  it 'is invalid without a phone number with correct format' do
    student = Student.new(phone_number: '6361093561')
    student.valid?
    expect(student.errors[:phone_number]).to include('is invalid')
  end
end
