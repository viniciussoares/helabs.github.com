#!/usr/bin/env ruby

require 'pry'

Dir["**/*.html"].each do |html_file|
  next if html_file.start_with?("node_modules")
  next if html_file.start_with?("spec")
  next if html_file.start_with?("_site")
  puts "Transforming file #{html_file}"
  content = File.read(html_file)
  content = content.gsub(/(<img[^>]+src=")([^">]+)"/) do |src|
    $1 + "{{ '#{ $2.gsub("/images/", "") }' | asset_path }}\""
  end
  File.write(html_file, content)
  puts "File #{html_file} transformed"
end
