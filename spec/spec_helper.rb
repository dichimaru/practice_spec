require "rails_helper"
require "rspec/retry"

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # DB settings
  config.use_transactional_examples = false

  config.before(:suite) do
    DatabaseRewinder.clean_all
  end

  config.after(:each) do
    DatabaseRewinder.clean
  end

  # rspec-retry
  config.verbose_retry                = true
  config.display_try_failure_messages = true
  config.around :each, type: :feature do |ex|
    ex.run_with_retry retry: ENV["CI"].present? ? 3 : 1
  end

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true unless meta.key?(:aggregate_failures)
  end
end
