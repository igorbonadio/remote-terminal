Given /^I am in the "(.*?)" directory$/ do |dir|
  @dir = dir
  @project = RemoteTerminal::Project.find(@dir)
end

When /^I get the path from my location$/ do
  @path = @project.path_from(@dir)
end

Then /^I should see "(.*?)"$/ do |path|
  @path.should be == path
end

When /^I get the path to my location$/ do
  @path = @project.path_to(@dir)
end