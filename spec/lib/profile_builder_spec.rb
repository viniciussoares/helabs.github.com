require 'spec_helper'

describe ProfileBuilder do
  describe '#build_pt' do
    context 'when complete vars params' do
      let(:vars) {
        {
          full_name:           'John Doe',
          parameterized_name:  'john-doe',
          slug:                'john',
          job_title:           'Developer',
          job_cool:            'Brew Master',
          location:            '-12.972532, -38.439881',
          social_accounts: {
            github:   'johndoe',
            twitter:  'johndoe',
            dribbble: 'johndoe',
            behance:  'johndoe'
          }
        }
      }

      let!(:file_path) { '_posts/team-members/pt/2015-06-03-john-doe.html' }

      before { ProfileBuilder.new(vars).build_pt }
      after { File.delete(file_path) }

      context 'file creation' do
        let(:file_text) { File.open(file_path, 'r').read }

        it { expect(File).to exist(file_path) }
        it { expect(file_text).to match('permalink: "/pt/nosso-time/john-doe') }
        it { expect(file_text).to match('en: "/en/our-team/john-doe"') }
        it { expect(file_text).to match('image: "/images/time/time-john-doe.jpg"') }
        it { expect(file_text).to match('image2x: "/images/time/time-john-doe@2x.jpg"') }
        it { expect(file_text).to match('full_name: John Doe') }
        it { expect(file_text).to match('job_title: Developer') }
        it { expect(file_text).to match('job_cool: Brew Master') }
        it { expect(file_text).to match('location: -12.972532, -38.439881') }
        it { expect(file_text).to match('slug: john') }
        it { expect(file_text).to match('github: johndoe') }
        it { expect(file_text).to match('twitter: johndoe') }
        it { expect(file_text).to match('dribbble: johndoe') }
        it { expect(file_text).to match('behance: johndoe') }
      end
    end

    context 'when not complete vars params' do
      let(:vars) {
        {
          full_name:           '',
          parameterized_name:  '',
          slug:                '',
          image:               '',
          job_title:           '',
          job_cool:            '',
          location:            '',
          social_accounts: {
            github:   '',
            twitter:  '',
            dribbble: '',
            behance:  ''
          }
        }
      }

      let(:file_path) { '_posts/team-members/pt/2015-06-03-.html' }

      before { ProfileBuilder.new(vars).build_pt }
      after { File.delete(file_path) }

      context 'file creation' do
        let(:file_text) { File.open(file_path, 'r').read }

        it { expect(File).to exist(file_path) }
        it { expect(file_text).to match('permalink: "/pt/nosso-time/\"') }
        it { expect(file_text).to match('en: "/en/our-team/\"') }
        it { expect(file_text).to match('image: "/images/time/time-.jpg"') }
        it { expect(file_text).to match('image2x: "/images/time/time-@2x.jpg"') }
        it { expect(file_text).to match('full_name: \n') }
        it { expect(file_text).to match('job_title: \n') }
        it { expect(file_text).to match('job_cool: \n') }
        it { expect(file_text).to match('slug: \n') }
        it { expect(file_text).to match('github: \n') }
        it { expect(file_text).to match('twitter: \n') }
        it { expect(file_text).to match('dribbble: \n') }
        it { expect(file_text).to match('behance: \n') }
      end
    end
  end

  describe '#build_en' do
    context 'when complete vars params' do
      let(:vars) {
        {
          full_name:           'John Doe',
          parameterized_name:  'john-doe',
          slug:                'john',
          job_title:           'Developer',
          job_cool:            'Brew Master',
          location:            '-12.972532, -38.439881',
          social_accounts: {
            github:   'johndoe',
            twitter:  'johndoe',
            dribbble: 'johndoe',
            behance:  'johndoe'
          }
        }
      }

      let(:file_path) { '_posts/team-members/en/2015-06-03-john-doe.html' }

      before { ProfileBuilder.new(vars).build_en }
      after { File.delete(file_path) }

      context 'file creation' do
        let(:file_text) { File.open(file_path, 'r').read }

        it { expect(File).to exist(file_path) }
        it { expect(file_text).to match('permalink: "/en/our-team/john-doe"') }
        it { expect(file_text).to match('pt: "/pt/nosso-time/john-doe"') }
        it { expect(file_text).to match('image: "/images/time/time-john-doe.jpg"') }
        it { expect(file_text).to match('image2x: "/images/time/time-john-doe@2x.jpg"') }
        it { expect(file_text).to match('full_name: John Doe') }
        it { expect(file_text).to match('job_title: Developer') }
        it { expect(file_text).to match('job_cool: Brew Master') }
        it { expect(file_text).to match('location: -12.972532, -38.439881') }
        it { expect(file_text).to match('slug: john') }
        it { expect(file_text).to match('github: johndoe') }
        it { expect(file_text).to match('twitter: johndoe') }
        it { expect(file_text).to match('dribbble: johndoe') }
        it { expect(file_text).to match('behance: johndoe') }
      end
    end

    context 'when not complete vars params' do
      let(:vars) {
        {
          full_name:           '',
          parameterized_name:  '',
          slug:                '',
          image:               '',
          job_title:           '',
          job_cool:            '',
          location:            '',
          social_accounts: {
            github:   '',
            twitter:  '',
            dribbble: '',
            behance:  ''
          }
        }
      }

      let(:file_path) { '_posts/team-members/en/2015-06-03-.html' }

      before { ProfileBuilder.new(vars).build_en }
      after { File.delete(file_path) }

      context 'file creation' do
        let(:file_text) { File.open(file_path, 'r').read }

        it { expect(File).to exist(file_path) }
        it { expect(file_text).to match('permalink: "/en/our-team/\"') }
        it { expect(file_text).to match('pt: "/pt/nosso-time/\"') }
        it { expect(file_text).to match('image: "/images/time/time-.jpg"') }
        it { expect(file_text).to match('image2x: "/images/time/time-@2x.jpg"') }
        it { expect(file_text).to match('full_name: \n') }
        it { expect(file_text).to match('job_title: \n') }
        it { expect(file_text).to match('job_cool: \n') }
        it { expect(file_text).to match('slug: \n') }
        it { expect(file_text).to match('github: \n') }
        it { expect(file_text).to match('twitter: \n') }
        it { expect(file_text).to match('dribbble: \n') }
        it { expect(file_text).to match('behance: \n') }
      end
    end
  end

  describe '#build_all' do
    it 'build all profiles' do
      vars = {}
      builder = ProfileBuilder.new(vars)

      expect(builder).to receive :build_pt
      expect(builder).to receive :build_en

      builder.build_all
    end
  end
end
