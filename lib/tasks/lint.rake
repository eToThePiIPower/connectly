require 'rubocop/rake_task'
require 'reek/rake/task'

task lint: 'lint:all'

namespace :lint do
  task all: [:rubocop, :reek]

  desc 'Lint ruby source files'
  RuboCop::RakeTask.new # :rubocop

  desc 'Detect code smells in Ruby'
  Reek::Rake::Task.new do |t|
    t.fail_on_error = false
  end
end
