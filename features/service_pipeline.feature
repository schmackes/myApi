Feature: As a user
         in order to define my task that wastes my time
	 I need to define the necessary steps to automate the task.


Scenario: Add a service pipeline
Given I am on the home page
And I follow "MyServices"
Then I should be on the ServicePipeline page

When I click "New Pipeline"
And I fill in pipeline_name with "Cucu Pipeline"
And I follow "Create Pipeline"
Then I should be on the ServicePipeline page
And I should see "Cucu Pipeline"

Scenario: Add a service to an existing service pipeline

