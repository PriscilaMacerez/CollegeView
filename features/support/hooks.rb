Before do
  case ENV['BROWSER']
    when 'chrome'
      chrome_path = Dir.glob(File.join(File.dirname(__FILE__), '../../browsers/chromedriver.exe')).first
      capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(:unexpectedAlertBehaviour=>"accept")
      browser = Watir::Browser.new :chrome,driver_path: chrome_path,desired_capabilities: capabilities
    when 'ff'
      ff_path = File.join(File.dirname(__FILE__), '../../browsers/geckodriver.exe')
      capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(:unexpectedAlertBehaviour=>"accept")
      browser = Watir::Browser.new :ff, {driver_path: ff_path,desired_capabilities:capabilities}
  end
  browser.driver.manage.window.maximize
  @browser = browser
  @home_page = HomePage.new(@browser)
  @college_view_page = CollegeViewPage.new(@browser)
end

After do |scenario|
  @browser.driver.quit
end

