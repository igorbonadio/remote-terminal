require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module RemoteTerminal
  describe CLI do
    it "should configure a new remote project" do
      FileUtils.rm('tmp/.remote-terminal') if Dir.exist?('tmp/.remote-terminal')
      CLI.config("addr", "user", "remote_dir", "tmp")
      config = YAML::load(File.open('tmp/.remote-terminal.yml'))
      config['address'].should be == "addr"
      config['user'].should be == "user"
      config['remote_directory'].should be == "remote_dir"
    end
    
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
    
    it "should remove the last '/' of a path" do
      CLI.without_slash('path/').should be == 'path'
      CLI.without_slash('path').should be == 'path'
    end
    
    it "should put the last '/' in a path" do
      CLI.with_slash('path/').should be == 'path/'
      CLI.with_slash('path').should be == 'path/'
    end
  end
end
