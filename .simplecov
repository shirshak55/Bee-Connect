SimpleCov.minimum_coverage 7.50
# TODO: Uncomment once you write tests for each file
# SimpleCov.minimum_coverage_by_file 80
SimpleCov.refuse_coverage_drop
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start :rails do
  add_group 'Channels', 'app/channels'
  add_group 'Mailers', 'app/mailers'
  add_group 'Policies', 'app/policies'
  add_filter 'vendor/'
end
