require 'spec_helper'

feature 'User creates a check list definition' do
  background do
    create_user_and_sign_in
  end

  scenario 'redirects to the list of check lists' do
    create_check_list_definition "Test list"

    user_should_be_on_check_lists_page
  end

  scenario 'with name, description and tasks', :js => true do
    create_check_list_definition "Test list", "This is a check list for test", ["Step 1", "Step 2", "Step 3"]
    within '.check-list-definition' do
      click_link "Test list"
    end

    check_list_title_should_be_displayed "Test list"
    check_list_description_should_be_displayed "This is a check list for test"
    tasks_should_be_in_right_order ["Step 1", "Step 2", "Step 3"]
  end
end
