Dir['./lib/tasks/**/*.rake'].each { |f| load f }

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

def ask(question)
  begin
    STDOUT.puts "#{question} (y/n)"
    input = STDIN.gets.strip.downcase
  end until %w(y n).include?(input)
  input
end

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
  require 'colored'

  answer = ask "Are your sure?"
  exit if answer == 'n'

  puts '=> Memorizing current branch name...'.magenta
  current_branch = `git branch | grep "*"`.gsub('*', '').strip

  puts '=> Remove staging branch...'.magenta
  system 'git branch -D staging'

  puts '=> Create orphan staging branch...'.magenta
  system 'git checkout --orphan staging'

  puts '=> Building javascript files...'.magenta
  system 'npm run build'

  puts '=> Disallow robots...'.magenta
  File.open('robots.txt', 'w') { |file| file.write "User-agent: *\nDisallow: /" }

  puts '=> Change CNAME...'.magenta
  File.open('CNAME', 'w') { |file| file.write 'staging.helabs.com.br' }

  puts '=> Add everything...'.magenta
  system 'git add --all'

  puts '=> Commit everything...'.magenta
  system 'git commit -m "Staging commit"'

  puts '=> Add staging remote...'.magenta
  system 'git remote add staging git@github.com:Helabs/staging.helabs.com.br.git'

  puts '=> Force push to staging. Get some coffee, it may take some time...'.magenta
  system 'git push -f staging staging:gh-pages'

  puts "=> Checkout #{current_branch} branch...".magenta
  system "git checkout #{current_branch}"

  puts '=> Done. It can take up to 10 minutes for your changes to appear staging.helabs.com.br'.yellow
end

desc 'Push to helabs.com'
task :production do
  require 'colored'

  answer = ask "Are your sure?"
  exit if answer == 'n'

  puts '=> Building javascript files...'.magenta
  system 'npm run build'

  puts '=> Add everything...'.magenta
  system 'git add --all'

  puts '=> Commit everything...'.magenta
  system 'git commit -m "Generated files"'

  puts '=> Pushing to production.'.magenta
  system 'git push'
end
