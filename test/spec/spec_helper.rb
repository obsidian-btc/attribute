require_relative '../test_init'
require_relative 'attribute/proof'

RSpec.configure do |config|
  config.pattern = '**/*.rb'
  config.formatter = :documentation
  config.filter_run :* => true
  config.run_all_when_everything_filtered = true
end
