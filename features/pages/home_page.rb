class HomePage
  include PageObject

  START_SEARCHING_BUTTON = {:xpath => '//*[@id="supermatch"]/div[3]/div[10]/div[2]/a/img'}

  def click_button(button)
    wait = Selenium::WebDriver::Wait.new(:timeout => 15)

    case(button)
      when 'START SEARCHING'
        browser.element(START_SEARCHING_BUTTON).click
        wait.until {browser.element(:id => 'supermatch')}
        @browser.driver.switch_to.frame('supermatch')
    end
  end
end