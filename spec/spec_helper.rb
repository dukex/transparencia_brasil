require 'rubygems'
require 'simplecov'
require 'pry'

SimpleCov.start { add_filter "/spec/" }

require 'webmock/rspec'
#require 'timecop'
require 'time'
require 'transparencia_brasil'

WebMock.disable_net_connect!

Dir["spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

[:get, :post, :delete, :put].each do |operation|
  Kernel.send(:define_method, "a_#{operation}") do |path|
    a_request(operation, TransparenciaBrasil.configuration.endpoint + path)
  end

  Kernel.send(:define_method, "stub_#{operation}") do |path|
    stub_request(operation, TransparenciaBrasil.configuration.endpoint + path)
  end
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new("#{fixture_path}/#{file}")
end

def stringify_values(hash)
  hash.inject({}) { |memo,(k,v)| memo.merge(k => v.to_s) }
end
