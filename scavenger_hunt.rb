require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'fileutils'

HTML_FILE_PATH = 'scavenger_hunt.html'

# Step 1
iwanttolearnruby_url = "http://iwanttolearnruby.com/"
iwantolearnruby_page = Nokogiri::HTML(open(iwanttolearnruby_url))
iwantolearnruby_image_url = iwanttolearnruby_url + iwantolearnruby_page.css('div.puzzles').css('img').first["src"]

# Step 2
rubylang_url = "http://www.ruby-lang.org/en/"
rubylang_page = Nokogiri::HTML(open(rubylang_url))
rubylang_word = rubylang_page.at_css("div#intro").css('h1').first.text.split.first.downcase

# Step 3


# Make sure we have a clean file
FileUtils.rm HTML_FILE_PATH if File.exist?(HTML_FILE_PATH)
FileUtils.touch HTML_FILE_PATH

# Open file and append data
open(HTML_FILE_PATH, 'a') do |f|
  f.puts "<img src='#{iwantolearnruby_image_url}'>"
  f.puts "<br>"
end
