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

desc 'Push to staging.helabs.com.br'
task :staging do
  p '=> Memorizing current branch name...'
  current_branch = `git branch | grep "*"`.gsub('*', '').strip

  p '=> Remove staging branch...'
  system 'git branch -D staging'

  p '=> Create orphan staging branch...'
  system 'git checkout --orphan staging'

  p '=> Disallow robots...'
  File.open('robots.txt', 'w') { |file| file.write "User-agent: *\nDisallow: /" }

  p '=> Change CNAME...'
  File.open('CNAME', 'w') { |file| file.write 'staging.helabs.com.br' }

  p '=> Add everything...'
  system 'git add --all'

  p '=> Commit everything...'
  system 'git commit -m "Staging commit"'

  p '=> Add staging remote...'
  system 'git remote add staging git@github.com:Helabs/staging.helabs.com.br.git'

  p '=> Force push to staging. Get some coffee, it may take some time...'
  system 'git push -f staging staging:gh-pages'

  p "=> Checkout #{current_branch} branch..."
  system "git checkout #{current_branch}"

  p '=> Done. It can take up to 10 minutes for your changes to appear staging.helabs.com.br'
end
