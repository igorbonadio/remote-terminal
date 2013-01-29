Given /^my user is "(.*?)"$/ do |user|
  @user = user
end

Given /^the working directory is "(.*?)"$/ do |dir|
  @dir = dir
end

When /^I execute the remote terminal configuration$/ do
  FileUtils.rm('tmp/.remote-terminal') if Dir.exist?('tmp/.remote-terminal')
  RemoteTerminal::CLI.config(@ip, @user, @dir, 'tmp')
end

Then /^I should see that a configuration file was created$/ do
  config = YAML::load(File.open('tmp/.remote-terminal.yml'))
  config['ip'].should be == @ip
  config['user'].should be == @user
  config['remote_directory'].should be == @dir
end

Given /^the remote computer's IP is (\d+)\.(\d+)\.(\d+)\.(\d+)$/ do |arg1, arg2, arg3, arg4|
  @ip = "#{arg1}.#{arg2}.#{arg3}.#{arg4}"
end