When /^I execute "(.*?)"$/ do |cmd|
  rsync = double()
  rsync.should_receive(:run).twice.and_return('rsync ')
  ssh = double()
  ssh.should_receive(:run).and_return('ssh ')
  @output = RemoteTerminal::CLI.execute(cmd, rsync, ssh, @dir)
end

Then /^I should see "(.*?)" output$/ do |path|
  @output.should be == "rsync ssh rsync "
end