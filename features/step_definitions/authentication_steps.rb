Given /^a user visits the sign in page$/ do
  visit signin_path
end


When /^they submit invalid signin information$/ do
  click_button "Sign In"
end

Then /^they should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign In"
end

Then /^they should see the students page$/ do
  visit '/students'
end

Then /^they should see a signout link$/ do
  expect(page).to have_link('Sign Out', href: signout_path)
end
