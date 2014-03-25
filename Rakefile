Dir['./lib/tasks/**/*.rake'].each { |f| load f }

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Remove unused images'
task :prune_images do
  require 'colored'

  plain_files_content = ''
  Dir['./**/*.{html,htm,scss,css,sass,yml,md,js,coffee,json,xml}'].each do |file_name|
    File.open file_name, mode: 'r' do |file|
      plain_files_content += file.readlines.join "\n"
    end
  end

  unused_images = Dir['./images/**/*.{jpg,jpeg,gif,png}'].reject do |image_file_name|
    plain_files_content.include? image_file_name.sub './', '/'
  end

  unused_images.each do |image_file_name|
    puts "Deleting: #{image_file_name}...".red
    File.delete image_file_name
  end

  puts "#{unused_images.count} unused images were deleted!".bold.red
end
