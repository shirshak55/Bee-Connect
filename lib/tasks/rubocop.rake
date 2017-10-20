# frozen_string_literal: true

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new do |task|
    # don't abort rake on failure
    task.fail_on_error = false
  end
  task default: ['rubocop:auto_correct']
rescue LoadError
  # rubocop unavailable
end
