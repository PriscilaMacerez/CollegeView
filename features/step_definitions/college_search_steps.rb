 Then(/^I click on "([^"]*)" section$/) do |section|
   @college_view_page.click_section(section)
 end

 And(/^I select "([^"]*)" Location$/) do |location|
   @college_view_page.select_location(location)
 end

 And(/^I select "([^"]*)" Majors$/) do |plan|
   @college_view_page.select_majors(plan)
 end

 And(/^I fill major field with "([^"]*)" value$/) do |value|
   @college_view_page.fill_major_field(value)
 end

 Then(/^I select result that math with "([^"]*)" value$/) do |value|
   @college_view_page.select_result(value)
 end

 And(/^I verify "([^"]*)" university name is returned$/) do |university|
   @college_view_page.verify_universities_results(university)
 end






