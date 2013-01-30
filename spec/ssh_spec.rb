require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module RemoteTerminal
  describe SSH do
    it "should execute the ssh command" do
      IO.should_receive(:popen).with("ssh server 'cd remote_directory && cmd'")
      ssh = SSH.new
      ssh.run('server', 'remote_directory', 'cmd')
    end
  end
end
