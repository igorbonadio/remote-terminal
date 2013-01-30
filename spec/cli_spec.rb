require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module RemoteTerminal
  describe CLI do
    it "should execute remote commands" do
      rsync = double()
      ssh = double()
      
      rsync.should_receive(:run).
        with('.', 'igorbonadio@10.210.123.4:~/Projects/MyProject').
          and_return("rsync ")
      
      ssh.should_receive(:run).
        with('igorbonadio@10.210.123.4', '~/Projects/MyProject/', 'make').
          and_return("rsync ")
          
      rsync.should_receive(:run).
        with('igorbonadio@10.210.123.4:~/Projects/MyProject/', '.').
          and_return("rsync ")
          
      CLI.execute('make', rsync, ssh, 'features/data/project/')
    end
    
    it "should execute remote commands in any subfolder" do
      rsync = double()
      ssh = double()
      
      rsync.should_receive(:run).
        with('../..', 'igorbonadio@10.210.123.4:~/Projects/MyProject').
          and_return("rsync ")
      
      ssh.should_receive(:run).
        with('igorbonadio@10.210.123.4', '~/Projects/MyProject/folder/subfolder/', 'make').
          and_return("rsync ")
          
      rsync.should_receive(:run).
        with('igorbonadio@10.210.123.4:~/Projects/MyProject/', '../..').
          and_return("rsync ")
          
      CLI.execute('make', rsync, ssh, 'features/data/project/folder/subfolder/')
    end
  end
end
