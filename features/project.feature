Feature: Project
  In order to use a remote terminal
  As a user
  I want to open and use a project
  
  Scenario: Get path from the current location
    Given I am in the "features/data/project" directory
    When I get the path from my location
    Then I should see "."
    
  Scenario: Get path from the current location
    Given I am in the "features/data/project/folder" directory
    When I get the path from my location
    Then I should see ".."
    
  Scenario: Get path from the current location
    Given I am in the "features/data/project/folder/subfolder" directory
    When I get the path from my location
    Then I should see "../.."
    
  Scenario: Get path to the current location
    Given I am in the "features/data/project" directory
    When I get the path to my location
    Then I should see ""
      
  Scenario: Get path to the current location
    Given I am in the "features/data/project/folder" directory
    When I get the path to my location
    Then I should see "folder/"
    
  Scenario: Get path to the current location
    Given I am in the "features/data/project/folder/subfolder" directory
    When I get the path to my location
    Then I should see "folder/subfolder/"