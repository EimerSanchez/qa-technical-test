desc 'Run all tests (Frontend, API, Logic)'
task :test_all do
  Rake::Task['test:frontend'].invoke
  Rake::Task['test:api'].invoke
  Rake::Task['test:logic'].invoke
end

namespace :test do
  desc 'Run Frontend tests (Cucumber)'
  task :frontend do
    puts "=== Running Frontend Tests ==="
    system('cd frontend && bundle exec cucumber -p default')
  end

  desc 'Run API tests (Cucumber)'
  task :api do
    puts "=== Running API Tests ==="
    system('cd api && bundle exec cucumber -p default')
  end

  desc 'Run Logic tests (RSpec)'
  task :logic do
    puts "=== Running Logic Tests ==="
    system('cd logic && bundle exec rspec')
  end
end

task default: :test_all
