# frozen_string_literal: true

lib = File.expand_path(%(lib), __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative %(./lib/pangea/version)

Gem::Specification.new do |spec|
  spec.name                  = %(pangea-component)
  spec.version               = PangeaComponent::VERSION
  spec.authors               = [%(drzthslnt@gmail.com)]
  spec.email                 = [%(drzthslnt@gmail.com)]
  spec.description           = %(componentize declarative resources)
  spec.summary               = %(componentize declarative resources)
  spec.homepage              = %(https://github.com/drzln/#{spec.name})
  spec.license               = %(MIT)
  spec.files                 = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  spec.require_paths         = [%(src)]
  spec.executables           = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.required_ruby_version = %(>= #{`cat .ruby-version`})

  %i[
    rubocop-rspec
    rubocop-rake
    keycutter
    rubocop
    rspec
    rake
    yard
  ].each do |gem|
    spec.add_development_dependency(gem)
  end

  %i[
    terraform-synthesizer
    abstract-synthesizer
  ].each do |gem|
    spec.add_runtime_dependency(gem)
  end

  spec.metadata[%(rubygems_mfa_required)] = %(true)
end
