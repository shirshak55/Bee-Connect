# frozen_string_literal: true

namespace :bundler do
  desc 'Update CVEDb and run bundler-audit'
  task :audit do
    require 'bundler/audit/cli'
    Bundler::Audit::CLI.start ['check', '--update']
  end
end

task default: 'bundler:audit'
