require 'rspec/core/rake_task'

desc 'run tests'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  t.pattern = 'spec/**/*_spec.rb'
end

desc 'clean'
task :clean do
  rm_rf '_site'
  FileList['**/*.bak'].clear_exclude.each do |f|
    rm_f f
  end
end

desc 'build the site'
task :build => [:spec, :clean] do
  sh 'bundle exec jekyll build'
end

desc 'rebuild, then deploy to remote'
task :deploy => [ :spec, :clean, :build ] do
  sh 'bundle exec s3_website push'
end

desc 'run server'
task :server do
    sh "bundle exec jekyll serve --watch"
end

