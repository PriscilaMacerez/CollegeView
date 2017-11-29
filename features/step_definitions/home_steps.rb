 Given(/^I navigate to "([^"]*)" page$/) do |page|
   @browser.goto(page)
 end

 When(/^I click on "([^"]*)" button$/) do |button|
   @home_page.click_button(button)
 end




