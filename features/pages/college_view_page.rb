class CollegeViewPage
  include PageObject

  LOCATION_SECTION = {:id => 'critHeader0'}
  MAJORS_SECTION = {:id => 'critHeader1'}
  LOCATIONS_ITEMS = {:class => 'ui-picklist-option-text'}
  MAJOR_BACHELOR_RADIO = {:id=> 'degreeTypeRadio0'}
  MAJOR_ASSOCIATE_RADIO = {:id => 'degreeTypeRadio1'}
  MAJOR_SEARCH_INPUT = {:id => 'majorSearchText'}
  CLEAR_LOCATION= {:id=> 'locationCriteriaClearButton'}
  WAIT = Selenium::WebDriver::Wait.new(:timeout => 20)

  def click_section(section)

    case(section)
      when 'Location'
        location = WAIT.until {
          element = browser.element(LOCATION_SECTION)
          element if element.exists?
        }
        location.click
      when 'Majors'
        majors = WAIT.until {
          element = browser.element(MAJORS_SECTION)
          element if element.exists?
        }
        majors.click
    end
  end

  def select_location(city)
    browser.element(CLEAR_LOCATION).click
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
        major_bachelor_radio = WAIT.until {
          element = browser.radio(MAJOR_BACHELOR_RADIO)
          element if element.visible?
        }
        major_bachelor_radio.set

      when 'Associate (2-year) Degree'
        major_associate_radio = WAIT.until {
          element = browser.element(MAJOR_ASSOCIATE_RADIO)
          element if element.exists?
        }
        major_associate_radio.set
    end
  end

  def fill_major_field(value)
    major_field = WAIT.until {
      element = browser.text_field(MAJOR_SEARCH_INPUT)
      element if element.exists?
    }
    major_field.clear
    major_field.send_keys(value)
  end

  def select_result(value)
    browser.element(:xpath => '//*[@id="matchingMajors"]//span[contains(text(),"'+value+'")]').click
  end

  def verify_universities_results(university,percentage)
    result = '//*[@class="ui-corner-all percentMatchContainer perfectMatch"]/div[text()="'+percentage+'%"]/parent::*/parent::*/following-sibling::div/div/a[text()="'+university+'"]'
    puts result
    browser.element(:xpath => result).exists?.should == true
  end
end