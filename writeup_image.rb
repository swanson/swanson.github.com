require 'optparse'

options = {}
opts = OptionParser.new do |o|
  o.banner = "Usage:\n\twriteup_image.rb path_to_file " +
    "\n\nOptions:\n\tpath_to_file\tan image to resize and optimize"
end
opts.parse!

if ARGV.empty?
  puts opts.banner
  exit
end

file = ARGV.shift

def scale_image_to_fixed_height!(file, height = 320)
  # shell out to ImageMagick
  system "convert #{file} -resize x#{height} #{file}"
end

def optimize_image!(file)
  # shell out to ImageOptim
  system "/Applications/ImageOptim.app/Contents/MacOS/ImageOptim #{file}"
end

scale_image_to_fixed_height! file
optimize_image! file

puts "Image resized and optimized!"