ENV['github'] ||= 'nadarei/mina'
# ENV['analytics_id'] ||= 'UA-xoeuou'

task :build do
  cmd = "bundle exec middleman build"
  cmd = "analytics_id=#{ENV['analytics_id'].inspect} #{cmd}" if ENV['analytics_id']
  system cmd
  raise "Failed" unless $?.to_i == 0
end

desc "Updates online documentation"
task :deploy => :build do
  system "git update-ghpages #{ENV['github']} -i build"
end
