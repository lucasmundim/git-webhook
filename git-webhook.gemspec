# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{git-webhook}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lucas Roxo Mundim"]
  s.date = %q{2009-07-29}
  s.email = %q{lucas.mundim@intelitiva.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/git-webhook.rb",
     "lib/git-webhook/builder.rb",
     "lib/git-webhook/core.rb",
     "lib/git-webhook/notifier.rb",
     "lib/git-webhook/repository.rb",
     "script/console",
     "spec/git-webhook_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/lucasmundim/git-webhook}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{git-webhook}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A github compatible post-receive web hook for git written in Ruby}
  s.test_files = [
    "spec/git-webhook_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<grit>, [">= 1.1.1"])
      s.add_runtime_dependency(%q<active_support>, [">= 2.3.3"])
    else
      s.add_dependency(%q<grit>, [">= 1.1.1"])
      s.add_dependency(%q<active_support>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<grit>, [">= 1.1.1"])
    s.add_dependency(%q<active_support>, [">= 2.3.3"])
  end
end
