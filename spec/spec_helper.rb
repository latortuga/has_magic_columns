require 'rspec'
begin
  require 'ruby-debug'
rescue LoadError
  # no debugger available
end

RSpec.configure do |config|
  # config.include My::Pony, My::Horse, :type => :farm
  # config.include MyExtras
  # config.predicate_matchers[:swim] = :can_swim?
  # config.mock_with :mocha
end

