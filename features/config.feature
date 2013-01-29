Feature: Configuration
  In order to use a remote terminal
  As a user
  I want to configure my remote terminal
  
  Scenario: Add configuration
    Given the remote computer's IP is 10.210.123.4
    And my user is "igorbonadio"
    And the working directory is "~/Projects/MyProject"
    When I execute the remote terminal configuration
    Then I should see that a configuration file was created