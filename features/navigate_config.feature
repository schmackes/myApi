Feature: Add/Edit/Delete Service

  As a standard user
  So that I can adjust my quickies
  I need to be able to navigate and add/edit/delete my quickies.

Background: none

Scenario: Navigate to service page
  Given I am on the home page
  And I follow "Services" 
  Then I should see "Services Overview"


Scenario: Create new service
 Given I am on the services page
 And I follow "New Service"
 Then I should see "New Service"
 When I fill in "service_name" with "Test Service"
 And I fill in "service_description" with "This is my new distance to home service."
 And I fill in "service_url" with "http://www.google.com/v1/blabla/json"
 And I press "Create Service"
 Then I should be on the service page
 And I should see "Test Service"