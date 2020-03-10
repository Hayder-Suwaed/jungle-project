require "rails_helper"

RSpec.feature "Visit Login Page", type: :feature, js: true do
  before :each do
    @user = User.create!(
      name: "Layth",
      email: "test@yahoo.com",
      password: "123456789",
      password_confirmation: "123456789",
    )
  end
  scenario "login to the form" do
    visit login_path
    fill_in name: "email", with: "test@yahoo.com"
    fill_in name: "password", with: "123456789"
    click_button "Submit"
    save_screenshot "login_to_the_form.png"
    expect(page).to have_content("Products")
  end
end