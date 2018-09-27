require 'rubocop/rake_task'
require 'reek/rake/task'
require 'scss_lint/rake_task'

task lint: 'lint:all'

namespace :lint do
  task all: [:rubocop, :reek, :scss_lint, :erblint, :eslint]

  desc 'Lint ruby source files'
  RuboCop::RakeTask.new # :rubocop

  desc 'Detect code smells in Ruby'
  Reek::Rake::Task.new do |t|
    t.fail_on_error = false
  end

  desc 'Lint scss source files'
  SCSSLint::RakeTask.new

  desc 'Lint ERB source files'
  task :erblint do
    sh "erblint --lint-all #{Rails.root}"
  end

  desc 'Lint JavaScript files'
  task :eslint do
    sh "PATH=$(npm bin):$PATH eslint --ignore-path .gitignore #{Rails.root}"
  end
end
