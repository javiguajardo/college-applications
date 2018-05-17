require 'rails_helper'

RSpec.feature "Students", type: :feature do
  let!(:institution) { FactoryGirl.create(:institution) }

  scenario 'user creates a student' do
    visit new_student_path

    expect {
      fill_in 'Name', with: 'Javier Guajardo'
      fill_in 'Email', with: 'f.javi.guajardo@gmail.com'
      fill_in 'Phone number', with: '(636) 109 - 3561'
      fill_in 'Date of birth', with: '1994-02-02'
      fill_in 'Graduation date', with: '2017-05-30'
      find('.custom-select option', text: institution.name).select_option
      click_button 'Submit'
    }.to change(Student, :count).by(1)

    aggregate_failures do
      expect(page).to have_content 'Student was successfully created'
      expect(page).to have_content 'Javier Guajardo'
      expect(page).to have_content 'f.javi.guajardo@gmail.com'
      expect(page).to have_content '(636) 109 - 3561'
      expect(page).to have_content 'February 2, 1994'
      expect(page).to have_content 'May 30, 2017'
    end
  end

  scenario 'user edits a student' do
    student = FactoryGirl.create(:student)

    visit edit_student_path(student.id)

    fill_in 'Name', with: 'Tim Jones'
    click_button 'Submit'

    expect(student.reload.name).to eq('Tim Jones')
  end

  scenario 'user deletes a student' do
    Student.create!(FactoryGirl.attributes_for(:student))

    visit students_path

    expect {
      find(:css, '.btn-danger').click
    }.to change(Student, :count).by(-1)

    expect(page).to have_content 'Student was successfully destroyed'
  end
end
