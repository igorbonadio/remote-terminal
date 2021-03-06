# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "remote-terminal"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Igor Bonadio"]
  s.date = "2013-02-02"
  s.description = "Remote Terminal uses SSH and RSync to help you to execute commands remotely as if you were running them locally"
  s.email = "igorbonadio@gmail.com"
  s.executables = ["rt", "rt-config"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc",
    "TODO"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/rt",
    "bin/rt-config",
    "features/config.feature",
    "features/data/project/.remote-terminal.yml",
    "features/data/project/folder/make",
    "features/data/project/folder/subfolder/.gitignore",
    "features/data/project/make",
    "features/project.feature",
    "features/remote-terminal.feature",
    "features/step_definitions/config_step.rb",
    "features/step_definitions/project_step.rb",
    "features/step_definitions/remote-terminal_step.rb",
    "features/support/env.rb",
    "lib/remote-terminal.rb",
    "lib/remote-terminal/cli.rb",
    "lib/remote-terminal/project.rb",
    "lib/remote-terminal/rsync.rb",
    "lib/remote-terminal/ssh.rb",
    "remote-terminal.gemspec",
    "spec/cli_spec.rb",
    "spec/project_spec.rb",
    "spec/rsync_spec.rb",
    "spec/spec_helper.rb",
    "spec/ssh_spec.rb",
    "tmp/.gitignore"
  ]
  s.homepage = "http://github.com/igorbonadio/remote-terminal"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Remote Terminal helps you to execute commands remotely as if you were running them locally"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.11.0"])
      s.add_development_dependency(%q<rdoc>, [">= 3.12"])
      s.add_development_dependency(%q<cucumber>, [">= 1.2.1"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.8.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0.6.4"])
    else
      s.add_dependency(%q<rspec>, [">= 2.11.0"])
      s.add_dependency(%q<rdoc>, [">= 3.12"])
      s.add_dependency(%q<cucumber>, [">= 1.2.1"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.8.4"])
      s.add_dependency(%q<simplecov>, [">= 0.6.4"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.11.0"])
    s.add_dependency(%q<rdoc>, [">= 3.12"])
    s.add_dependency(%q<cucumber>, [">= 1.2.1"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.8.4"])
    s.add_dependency(%q<simplecov>, [">= 0.6.4"])
  end
end

