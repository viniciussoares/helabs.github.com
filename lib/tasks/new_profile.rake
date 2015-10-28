desc 'Creates a cozy profile for a new teammate. Welcome to HE:labs!'
task :new_profile do
  require 'erb'
  require 'ostruct'
  require 'i18n'
  require 'digest'

  NewProfileTask.run
end

module NewProfileTask
  require_relative '../profile_builder'

  class << self
    def run
      # Required fields
      while (name = ask('Your full name:')).nil?; end
      while (job_title = ask('Your job title:')).nil?; end
      while (slug = ask('Your @helabs.com.br username:')).nil?; end
      while (location = ask("Your latitude and longitude e.g. \e[33m-22.918747, -43.177080\e[0m\:")).nil?; end

      job_cool = ask("A \"cool\" job title to be shown on your profile page (Defaults to the job title)")
      twitter  = ask('Your twitter handle:')
      github   = ask('Your github user:')
      dribbble = ask('Your dribbble user:')
      behance  = ask('Your behance user:')

      info_about_picture(name)

      vars = {
        full_name:           name,
        parameterized_name:  parametrized_name(name),
        slug:                slug,
        location:            location,
        job_title:           job_title,
        job_cool:            job_cool,
        social_accounts: {
          github:   github,
          twitter:  twitter,
          dribbble: dribbble,
          behance:  behance
        }
      }

      ProfileBuilder.new(vars).build_all
    end

    private

    def parametrized_name(name)
      I18n.enforce_available_locales = false
      I18n.transliterate(name).gsub(' ', '-').downcase
    end

    def ask(question, opts = {default_value: nil})
      STDOUT.print "#{question} "
      answer = STDIN.gets.chomp.strip
      !answer.empty? && answer || opts[:default_value]
    end

    def info_about_picture(name)
      puts "Your picture file name should be: #{yellow("time-#{parametrized_name(name)}.jpg")} and #{yellow("time-#{parametrized_name(name)}@2x.jpg")}."
    end

    def yellow(text)
      "\e[33m#{text}\e[0m"
    end
  end
end
