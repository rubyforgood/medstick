require 'simplecov'
SimpleCov.start 'rails' do
  enable_coverage :branch
  minimum_coverage 90
end
