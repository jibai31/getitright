# Selenium tests cannot use DB transactions.
# This config sets a transaction strategy for all tests,
# and overrides it with a truncation strategy for all Selenium tests.

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  config.before :each, :js => true  do
    DatabaseCleaner.strategy = :truncation, { pre_count: true }
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each)  { DatabaseCleaner.clean }
end
