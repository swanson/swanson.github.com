require 'date'
require 'optparse'

EDITOR = "atom"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: generate.rb title category"

  opts.on("-c category", [:blog, :writeup], "Category (e.g blog, writeup)") do |category|
    options[:category] = category
  end
end.parse!

options[:title] = ARGV.pop
options[:category] ||= :blog
options[:layout] = options[:category] == :blog ? :post : :writeup

raise OptionParser::MissingArgument unless options[:title]

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

system "#{EDITOR} #{filename}"
puts "Crush it!"
