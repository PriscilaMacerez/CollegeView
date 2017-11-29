class CollegeViewPage
  include PageObject

  LOCATION_SECTION = {:xpath => '//*[@id="critHeader0"]'}
  MAJORS_SECTION = {:xpath => '//*[@id="critHeader1"]'}
  LOCATIONS_LIST = {:xpath => '//*[@id="locationCriteria"]/div[1]/div/div[1]'}
  LOCATIONS_ITEMS = {:class => 'ui-picklist-option-text'}
  MAJOR_BACHELOR_RADIO = {:xpath => '//*[@id="degreeTypeRadio0"]'}
  MAJOR_ASSOCIATE_RADIO = {:xpath => '//*[@id="degreeTypeRadio1"]'}
  MAJOR_SEARCH_INPUT = {:xpath => '//*[@id="majorSearchText"]'}

  def click_section(section)
    case(section)
      when 'Location'
        location = browser.element(LOCATION_SECTION )
        location.click
      when 'Majors'
        majors = browser.element(MAJORS_SECTION)
        majors.click
    end
  end

  def select_location(city)
    browser.element(LOCATIONS_LIST).click
    cities = browser.elements(LOCATIONS_ITEMS)
    for index in 0 ... cities.size
      if cities[index].text == city
        cities[index].click
      end
    end
  end

  def select_majors(plan)
    case plan
      when 'Bachelor\'s (4-year) Degree'
       browser.element(MAJOR_BACHELOR_RADIO).click
      when 'Associate (2-year) Degree'
        browser.element(MAJOR_ASSOCIATE_RADIO).click
    end
  end

  def fill_major_field(value)
    majorField = browser.text_field(MAJOR_SEARCH_INPUT)
    majorField.clear
    majorField.send_keys(value)
  end

  def select_result(value)
    browser.element(:xpath => '//*[@id="matchingMajors"]//span[contains(text(),"'+value+'")]').click
  end

  def verify_universities_results(university)
    browser.element(:xpath => '//a[text()="'+university+'"]')
  end
end