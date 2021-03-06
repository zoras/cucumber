# Detect the platform we're running on so we can tweak behaviour
# in various places.
require 'yaml'

module Cucumber
  VERSION       = '0.9.0'
  BINARY        = File.expand_path(File.dirname(__FILE__) + '/../../bin/cucumber')
  LIBDIR        = File.expand_path(File.dirname(__FILE__) + '/../../lib')
  JRUBY         = defined?(JRUBY_VERSION)
  IRONRUBY      = defined?(RUBY_ENGINE) && RUBY_ENGINE == "ironruby"
  WINDOWS       = Config::CONFIG['host_os'] =~ /mswin|mingw/
  OS_X          = Config::CONFIG['host_os'] =~ /darwin/
  WINDOWS_MRI   = WINDOWS && !JRUBY && !IRONRUBY
  RAILS         = defined?(Rails)
  RUBY_BINARY   = File.join(Config::CONFIG['bindir'], Config::CONFIG['ruby_install_name'])
  RUBY_1_9      = RUBY_VERSION =~ /^1\.9/
  RUBY_1_8_7    = RUBY_VERSION =~ /^1\.8\.7/

  class << self
    attr_accessor :use_full_backtrace

    def file_mode(m) #:nodoc:
      RUBY_1_9 ? "#{m}:UTF-8" : m
    end
  end
  self.use_full_backtrace = false
end
