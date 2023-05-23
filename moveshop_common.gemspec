require_relative "lib/moveshop_common/version"

Gem::Specification.new do |spec|
  spec.name        = "moveshop_common"
  spec.version     = MoveshopCommon::VERSION
  spec.authors     = ["RumanOnMove"]
  spec.email       = ["oruman@moveon.com.bd"]
  spec.summary     = "Summary of MoveshopCommon."
  spec.description = "Description of MoveshopCommon."
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "https://github.com/RumanOnMove/moveshop_common"

  spec.metadata["source_code_uri"] = "https://github.com/RumanOnMove/moveshop_common"
  spec.metadata["changelog_uri"] = "https://github.com/RumanOnMove/moveshop_common/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "spree"
  spec.add_dependency "rails", ">= 7.0.4.3"
end
