require 'spec_helper'

feature "Display started checklists" do
  background do
    create_user_and_sign_in
    @started_checklist = create(:check_list, user: @current_user, name: 'STARTED list')
    @completed_checklist = create(:check_list, user: @current_user, status: 'completed', name: 'DONE list')
  end
  
  scenario "only shows started checklists" do
    visit check_lists_path(status: 'started')
    expect(page).to have_content 'STARTED list'
    expect(page).not_to have_content 'DONE list'
  end
end
