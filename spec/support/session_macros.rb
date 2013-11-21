module SessionMacros

  # === ARRANGE HELPERS =========================================

  def create_user(email, password, name = nil)
    FactoryGirl.create(:user, email: email, password: password, name: name)
  end

  def create_user_with_provider(email, provider, name = nil)
    FactoryGirl.create(:user_with_authentication, email: email, name: name)
  end

  def create_user_and_sign_in
    create_user 'jane.doe@example.com', 'password', 'Jane Doe'
    sign_in_with 'jane.doe@example.com', 'password'
  end

  # === ACT HELPERS =============================================

  def sign_up_with(email, password, password_confirmation = nil)
    password_confirmation ||= password
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in_with(email, password)
    visit new_user_session_path
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Sign in"
  end

  def sign_in_with_provider(provider)
    visit root_path
    click_link provider
  end

  # === ASSERT HELPERS ==========================================

  def user_should_be_signed_in
    expect(page).to have_content('Sign out')
  end

  def user_should_be_signed_in_as(name)
    user_should_be_signed_in
    expect(page).to have_content(name)
  end

  def user_should_be_signed_out
    expect(page).to have_content("Sign in")
  end

  def page_should_display_sign_in_error
    page.should have_css('div.error', 'Incorrect email or password')
  end

end
