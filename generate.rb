require 'date'
require 'optparse'

options = {}
opts = OptionParser.new do |opts|
  opts.banner = "Usage:\n\tgenerate.rb title category " + 
    "\n\nOptions:\n\tcategory\tblog, writeup"
end
opts.parse!

if ARGV.empty?
  puts opts.banner
  exit
end

options[:title] = ARGV.shift
options[:category] = ARGV.shift || "blog"
options[:layout] = options[:category] == "writeup" ? "writeup" : "post"

def slug(title)
  title.downcase.gsub(/[^\w]/, " ").strip.gsub(/\s+/, '-')
end

template = '''---
layout: %{layout}
title: "%{title}"
categories:
- %{category}
---

Go-go-gadget blog post
'''

content = template % options
filename = "_posts/#{Date.today}-#{slug(options[:title])}.md"

File.open(filename, "w") do |file|
  file.write(content)
end

system "subl -n . #{filename}"
puts "Crush it!"
