Feature: Remote Terminal
  In order to use a remote terminal
  As a user
  I want to execute some commands
  
  Scenario: Root
    Given I am in the "features/data/project" directory
    When I execute "make"
    Then I should see "features/data/project/make" output
    
  Scenario: Folder
    Given I am in the "features/data/project/folder" directory
    When I execute "make"
    Then I should see "features/data/project/folder/make" output
    
  Scenario: Folder
    Given I am in the "features/data/project/folder/subfolder" directory
    When I execute "make"
    Then I should see "features/data/project/folder/subfolder/make" output