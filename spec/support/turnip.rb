require "rails_helper"

require "turnip"
require "turnip/rspec"
require "turnip/capybara"

Dir.glob("spec/**/*steps.rb") { |f| load f, true }

RSpec.configure do |config|
  # stepが存在しなかったらエラーにする
  config.raise_error_for_unimplemented_steps = true
end
