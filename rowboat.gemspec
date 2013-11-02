# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "rowboat"
  spec.version       = "0.0.1"
  spec.authors       = ["Paul Barry"]
  spec.email         = ["mail@paulbarry.com"]
  spec.description   = %q{A ruby library for converting tabular data into an object graph}
  spec.summary       = %q{A ruby library for converting tabular data into an object graph}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
