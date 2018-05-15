require 'rails_helper'

RSpec.feature "Institutions", type: :feature do
	scenario 'user creates a new institution' do
		visit new_institution_path

		expect {
			fill_in 'Name', with: 'University of New York'
			select 'New York, New York', from: 'Location'
			fill_in 'Application deadline', with: '2018-05-13'
			click_button 'Submit'
		}.to change(Institution, :count).by(1)

    aggregate_failures do
      expect(page).to have_content 'Institution was successfully created'
      expect(page).to have_content 'University of New York'
      expect(page).to have_content 'New York, New York'
      expect(page).to have_content 'May 13, 2018'
    end
  end

  scenario 'user edits an institution' do
    institution = FactoryGirl.create(:institution)

    visit edit_institution_path(institution.id)

    fill_in 'Name', with: 'Harvard University'
    click_button 'Submit'

    expect(institution.reload.name).to eq('Harvard University')

    aggregate_failures do
      expect(page).to have_content 'Institution was successfully updated'
      expect(page).to have_content 'Harvard University'
    end
  end

  scenario 'user deletes an institution' do
    Institution.create!(FactoryGirl.attributes_for(:institution))

    visit institutions_path

    expect {
      find(:css, '.btn-danger').click
    }.to change(Institution, :count).by(-1)

    expect(page).to have_content 'Institution was successfully destroyed'
  end
end
