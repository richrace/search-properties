# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'coveralls'

Coveralls.wear!
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  Geocoder.configure(:lookup => :test)

  Geocoder::Lookup::Test.add_stub(
    [51.510772, -0.119305], [
      {
        'latitude'     => 51.510772,
        'longitude'    => -0.119305,
        'address'      => 'London, UK',
        'state'        => 'London',
        'state_code'   => 'LN',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )

  Geocoder::Lookup::Test.add_stub(
    "london", [
      {
        'latitude'     => 51.510772,
        'longitude'    => -0.119305,
        'address'      => 'London, UK',
        'state'        => 'London',
        'state_code'   => 'LN',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )

  Geocoder::Lookup::Test.add_stub(
    [51.501, -0.142], [
      {
        'latitude'     => 51.501,
        'longitude'    => -0.142,
        'address'      => 'Westminster, UK',
        'state'        => 'Greater London',
        'state_code'   => 'LN',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )

  Geocoder::Lookup::Test.add_stub(
    "esher", [
      {
        'latitude'     => 51.369275,
        'longitude'    => -0.365338,
        'address'      => 'Esher, UK',
        'state'        => 'Greater London',
        'state_code'   => 'LN',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )

  Geocoder::Lookup::Test.add_stub(
    [51.405417, -0.265560], [
      {
        'latitude'     => 51.405417,
        'longitude'    => -0.265560,
        'address'      => 'New Malden, UK',
        'state'        => 'Greater London',
        'state_code'   => 'LN',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )
end
