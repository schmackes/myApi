Feature: Add/Edit/Delete Configuration

  As a standard user
  So that I can adjust my quickies
  I need to be able to navigate and add/edit/delete my quickies.

Background: none

Scenario: Navigate to configuration page
  Given I am on the home page
  And I follow "Config" 
  Then I should see "Config Overview"

