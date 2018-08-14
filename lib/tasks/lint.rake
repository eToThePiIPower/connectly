require 'rubocop/rake_task'

task lint: 'lint:all'

namespace :lint do
  task all: [:rubocop]

  desc 'Lint ruby source files'
  RuboCop::RakeTask.new # :rubocop
end
