# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'remindmeto/os'
require 'remindmeto/version'

post_install_message = "\e[32mThis gem requires the libnotify1 package on Ubuntu. Install with:\e[0m\n"
post_install_message += "\t\e[31msudo apt-get install libnotify1\e[0m"

Gem::Specification.new do |spec|
  spec.name          = "remindmeto"
  spec.version       = RemindMeTo::VERSION
  spec.authors       = ["Hunter Clarke"]
  spec.email         = ["hunter@hunterc.com"]
  spec.description   = %q{A simple Ruby client for ubuntu notification reminders}
  spec.summary       = %q{Intuitive command-line reminders}
  spec.homepage      = "https://github.com/hclarke3/remindmeto"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w[lib]
  spec.post_install_message = post_install_message

  spec.add_runtime_dependency('terminal-notifier', '~> 1.5') if RemindMeTo::OS.mac?
  spec.add_runtime_dependency('growl', '~> 1.0')             if RemindMeTo::OS.mac? || RemindMeTo::OS.windows?
  spec.add_runtime_dependency('libnotify', '~> 0.8')         if RemindMeTo::OS.linux?

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
end
