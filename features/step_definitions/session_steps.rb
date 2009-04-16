Given /I am logged in as "(\w+)"/ do |name|
  visit '/admin/login'
  fill_in 'Username', :with => name.downcase
  fill_in 'Password', :with => 'password'
  click_button 'Login'
end

# Log in as a user with no particular role
Given /I am logged in\s*$/ do
  Given 'I am logged in as "Existing"'
end

Given "I am logged out" do
  visit '/logout' rescue nil # Radiant barfs on logging out when you're not logged in
end