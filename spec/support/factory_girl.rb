# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint unless config.files_to_run.one?
    ensure
      DatabaseCleaner.clean
    end
  end
end
