Gem::Specification.new do |s|
  s.name = "mmdoc"
  s.version = "0.0.1"
  s.summary = ""
  s.description = ""
  s.authors = ["Rico Sta. Cruz"]
  s.email = ["rico@sinefunc.com"]
  s.homepage = ""
  s.files = `git ls-files`.strip.split("\n")
  s.executables = Dir["bin/*"].map { |f| File.basename(f) }

  s.add_dependency "middleman-core", ">= 3.0.0.rc.1"
end
