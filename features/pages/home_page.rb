class HomePage
  include PageObject

  START_SEARCHING_BUTTON = {:xpath => '//img[@src="/_img/start_searching.jpg"]'}
  FRAME_CONTAINER = {:id => 'supermatch'}
  WAIT = Selenium::WebDriver::Wait.new(:timeout => 15)

  def click_button(button)
    case(button)
      when 'START SEARCHING'
        start_search = wait_element(START_SEARCHING_BUTTON)
        start_search.click

        frame_container = wait_element(FRAME_CONTAINER)
        @browser.driver.switch_to.frame(frame_container.attribute("id"))
    end
  end

  def wait_element(element_reference)
    ele = WAIT.until{
      element = browser.element(element_reference)
      element if element.exists?
    }
  end
end