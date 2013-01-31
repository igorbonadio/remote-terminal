require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module RemoteTerminal
  describe Project do
    it "should find and load a remote project" do
      config = YAML::load(File.open('features/data/project/.remote-terminal.yml'))
      project = Project.find('features/data/project')
      project.address.should be == config['address']
      project.user.should be == config['user']
      project.remote_directory.should be == config['remote_directory']
    end
    
    it "should show a path to the local folder" do
      project = Project.find('features/data/project')
      project.path_to("features/data/project").should be == ""
      project.path_to("features/data/project/folder").should be == "folder/"
      project.path_to("features/data/project/folder/subfolder").should be == "folder/subfolder/"
      project.path_to("features/data/project/").should be == ""
      project.path_to("features/data/project/folder/").should be == "folder/"
      project.path_to("features/data/project/folder/subfolder/").should be == "folder/subfolder/"
    end
    
    it "should show a path from the local folder"
  end
end
