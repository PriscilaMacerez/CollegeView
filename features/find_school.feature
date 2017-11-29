Feature:Find a school match using Location and Major

  Scenario: Find a school match using Location and Major
    Given I navigate to "http://www.collegeview.com/" page
    When I click on "START SEARCHING" button
    Then I click on "Location" section
    And I select "Ohio" Location
    And I click on "Majors" section
    And I select "Bachelor's (4-year) Degree" Majors
    And I fill major field with "Computer Software Engineering" value
    Then I select result that math with "Computer Software Engineering" value
    And I verify "Miami University-Oxford" university name is returned

