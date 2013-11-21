module CheckListDefinitionsMacros
  # === ARRANGE HELPERS =========================================

  # === ACT HELPERS =============================================
  def create_check_list_definition(name, description = nil, tasks = [])
    visit new_check_list_definition_path
    fill_in "Name", with: name
    fill_in "Description", with: description
    tasks.each_with_index do |task, index|
      fill_in "check_list_definition_task_definitions_attributes_#{index}_text", with: task
      click_link "addTaskBtn"
    end
    click_button "OK"
  end

  # === ASSERT HELPERS ==========================================

  def check_list_title_should_be_displayed(title)
    expect(page).to have_selector 'h1', text: title
  end

  def check_list_description_should_be_displayed(description)
    expect(page).to have_content description
  end

  def tasks_should_be_in_right_order(tasks)
    expect(page.text).to match /#{tasks.join(".*")}/
  end
end
