# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # custom test helper methods
  def should_validate_length(attribute_names)
    attribute_names.each do |name|
      should validate_length_of(name.to_sym).is_at_most(255)
    end
  end

  def should_validate_length_of_string_attributes_for_described_class(options={})
    return should_validate_specific_fields(options) if (options[:only].present? || options[:except].present?)
    should_validate_length(described_class.columns_hash.values.select do |v|
      v.sql_type == 'character varying'
    end.map(&:name))
  end

  def should_validate_specific_fields(options={})
    return should_validate_length_of_only(options[:only]) if options[:only].present?
    return should_validate_length_of_except(options[:except]) if options[:except].present?
  end

  def should_validate_length_of_only(*attributes)
    should_validate_length_of_each(attributes)
  end

  def should_validate_length_of_except(*attributes)
    should_validate_length_of_each(described_class.columns_hash.values.select do |v|
      attributes.include? v
    end.map(&:name))
  end

  def should_validate_length_of_each(array)
    array.each {|attribute| should_validate_length(attribute)}
  end

  def should_have_a_valid_factory
    described_instance = FactoryGirl.build(described_class.name.underscore.to_sym)
    expect(described_instance).to be_valid
  end
end
