module CapybaraHelper
  def save_screenshot_and_open_page
    Capybara::Screenshot.screenshot_and_open_image
  end
end