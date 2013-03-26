Given(/^I run the command "(.*?)"$/) do |command|
  system("#{command} &> /dev/null &")
end

When(/^I visit the url "(.*?)"$/) do |url|
  @session = Capybara::Session.new(:selenium)
  @session.visit url
end

Then(/^I should see the root page$/) do
  @session.should have_content "Hello World"
end
