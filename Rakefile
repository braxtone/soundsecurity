require 'rspec/core/rake_task'

desc 'run tests'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = [ "--color", "--format progress", "--order rand", "-r ./spec/spec_helper.rb" ]
  t.pattern = 'spec/**/*_spec.rb'
end

desc 'build the site'
task :build => [:spec] do
  sh 'bundle exec jekyll build'
end

desc 'rebuild, then deploy to remote'
task :deploy => [ :spec, :build ] do
  sh 'bundle exec s3_website push'
end

desc 'run server'
task :server do
  sh "bundle exec jekyll serve --watch"
end

