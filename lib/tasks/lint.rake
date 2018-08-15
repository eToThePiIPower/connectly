require 'rubocop/rake_task'
require 'reek/rake/task'
require 'scss_lint/rake_task'

task lint: 'lint:all'

namespace :lint do
  task all: [:rubocop, :reek, :scss_lint, :erblint]

  desc 'Lint ruby source files'
  RuboCop::RakeTask.new # :rubocop

  desc 'Detect code smells in Ruby'
  Reek::Rake::Task.new do |t|
    t.fail_on_error = false
  end

  desc 'Lint scss source files'
  SCSSLint::RakeTask.new

  desc 'LInt ERB source files'
  task :erblint do
    sh "erblint --lint-all #{Rails.root}"
  end
end
