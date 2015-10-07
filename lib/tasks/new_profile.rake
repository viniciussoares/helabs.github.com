task :new_profile do
  require 'erb'
  require 'ostruct'
  require 'i18n'
  require 'digest'

  NewProfileTask.run
end

module NewProfileTask
  class << self
    def run
      # Required fields
      while (name = ask('Your full name:')).nil?; end
      while (image = ask('URL to an image of you (tip: type in your email to get your gravatar image)')).nil?; end
      while (job_title = ask('Your job title:')).nil?; end
      while (slug = ask('Your @helabs.com.br username:')).nil?; end
      while (location = ask("Your latitude and longitude e.g. \e[33m-22.918747, -43.177080\e[0m\:")).nil?; end

      if image =~ /[\w+]+@[\w|\.]+/
        image ='http://gravatar.com/avatar/' + Digest::MD5.hexdigest(image) + '?s=160'
      end

      job_cool = ask("A \"cool\" job title to be shown on your profile page (Defaults to the job title)")
      twitter  = ask('Your twitter handle:')
      github   = ask('Your github user:')
      dribbble = ask('Your dribbble user:')
      behance  = ask('Your behance user:')

      vars = {
        full_name: name,
        parameterized_name: I18n.transliterate(name).gsub(' ', '-').downcase,
        image: image,
        slug: slug,
        location: location,
        job_title: job_title,
        job_cool: job_cool,
        social_accounts: {
          github:   github,
          twitter:  twitter,
          dribbble: dribbble,
          behance:  behance
        }
      }
      template_vars = OpenStruct.new(vars)

      post_file_name = Time.now.strftime('%Y-%m-%d')
      post_file_name << "-#{vars[:parameterized_name]}"

      new_profile_pt = ERB.new(File.read('lib/templates/new_profile-pt.yml.erb'))
      File.open("_posts/team-members/pt/#{post_file_name}.html", 'w') do |f|
        f.puts new_profile_pt.result(template_vars.instance_eval { binding })
      end

      new_profile_en = ERB.new(File.read('lib/templates/new_profile-en.yml.erb'))
      File.open("_posts/team-members/en/#{post_file_name}.html", 'w') do |f|
        f.puts new_profile_en.result(template_vars.instance_eval { binding })
      end
    end

    def ask(question, opts = {default_value: nil})
      STDOUT.print "#{question} "
      answer = STDIN.gets.chomp.strip
      !answer.empty? && answer || opts[:default_value]
    end
  end
end
