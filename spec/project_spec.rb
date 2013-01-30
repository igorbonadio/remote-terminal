require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module RemoteTerminal
  describe Project do
    it "should get project's configuration" do
      config = YAML::load(File.open('tmp/.remote-terminal.yml'))
      project = Project.find('tmp')
      project.ip.should be == config['ip']
      project.user.should be == config['user']
      project.remote_directory.should be == config['remote_directory']
    end
  end
end
