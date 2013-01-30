require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module RemoteTerminal
  describe Rsync do
    it "should execute the rsync command" do
      IO.should_receive(:popen).with("rsync -raze ssh --delete orig dest")
      rsync = Rsync.new
      rsync.run('orig', 'dest')
    end
  end
end
