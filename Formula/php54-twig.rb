require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Twig < AbstractPhpExtension
  homepage 'http://twig.sensiolabs.org/'
  url 'https://github.com/fabpot/Twig/tarball/v1.9.1'
  md5 '33d5be1db521fe76504bff316d2e58fd'
  head 'git://github.com/fabpot/Twig.git', :using => :git

  def install
    # See https://github.com/mxcl/homebrew/pull/5947
    ENV.universal_binary

    Dir.chdir 'ext/twig' do
      system "phpize"
      system "./configure", "--prefix=#{prefix}"
      system "make"
      prefix.install %w(modules/twig.so)
    end
    write_config_file unless ARGV.include? "--without-config-file"
  end
end
