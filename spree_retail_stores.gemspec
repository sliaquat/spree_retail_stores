# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_retail_stores'
  s.version     = '0.1.0'
  s.summary     = 'Adds retail stores to spree commerce'
  s.description = 'Includes longitude and latitudes of the stores and timings. API enabled.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Sanad Liaquat'
  s.email     = 'sanadhussain@gmail.com'
  s.homepage  = 'https://github.com/sliaquat'

  # s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.4.1'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end

