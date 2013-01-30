require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module RemoteTerminal
  describe Project do
    it "should get project's configuration" do
      config = YAML::load(File.open('features/data/project/.remote-terminal.yml'))
      project = Project.find('features/data/project')
      project.ip.should be == config['ip']
      project.user.should be == config['user']
      project.remote_directory.should be == config['remote_directory']
    end
  end
end
