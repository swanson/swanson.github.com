task :default => [:server]

desc 'Build the Jekyll site for local previewing'
task :server do
  system "jekyll serve --watch --incremental"
end

task :serve => :server
