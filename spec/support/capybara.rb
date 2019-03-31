require "capybara/rspec"
require "selenium-webdriver"

class ChromeOption
  class << self
    def build(args = [])
      Selenium::WebDriver::Chrome::Options.new.tap do |options|
        options.add_argument("no-sandbox")
        options.add_argument("window-size=1240,1680")
        args.each { |arg| options.add_argument(arg) }
      end
    end
  end
end

# Capybara driver
Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("headless")
  options.add_argument("--disable-gpu")
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# Capybara config
Capybara.configure do |capybara_config|
  capybara_config.default_driver = :selenium_chrome
  capybara_config.default_max_wait_time = 10
  capybara_config.default_driver        = ENV["CI"] ? :headless_chrome : :chrome
end

Capybara.javascript_driver = Capybara.default_driver
