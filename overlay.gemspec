# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','overlay_version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'overlay'
  s.version = Overlay::VERSION
  s.author = 'Your Name Here'
  s.email = 'your@email.address.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A description of your project'
# Add your other files here if you make them
  s.files = %w(
bin/overlay
lib/overlay_version.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','overlay.rdoc']
  s.rdoc_options << '--title' << 'overlay' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'overlay'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_runtime_dependency('gli')
end
