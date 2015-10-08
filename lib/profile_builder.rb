class ProfileBuilder
  PROFILE_PATHS = {
    pt: 'lib/templates/new_profile-pt.yml.erb',
    en: 'lib/templates/new_profile-en.yml.erb'
  }

  attr_reader :template_vars

  def initialize(vars)
    @template_vars = OpenStruct.new(vars)
  end

  def build_all
    build_pt
    build_en
  end

  def build_pt
    build_profile(:pt)
  end

  def build_en
    build_profile(:en)
  end

  private

  def build_profile(country_sym)
    profile   =  ERB.new(File.read(PROFILE_PATHS.fetch(country_sym)))
    file_path = "_posts/team-members/#{country_sym.to_s}/#{file_name}.html"

    File.open(file_path, 'w') do |f|
      f.puts profile.result(template_vars.instance_eval { binding })
    end
  end

  def file_name
    "#{Time.now.strftime('%Y-%m-%d')}-#{template_vars.parameterized_name}"
  end
end
