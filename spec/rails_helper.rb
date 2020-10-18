# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

ActiveJob::Base.queue_adapter = :inline
FactoryBot::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'simplecov'
SimpleCov.start do
  add_filter %r{^/spec/}
  add_filter /^*session*/
  add_filter /^*devise*/
end

require 'rspec/rails'
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.include FactoryBot::Syntax::Methods
  config.include AuthenticationHelper
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
