Feature: Manage Clients
  In order list our experience
  As a content creator
  I want to manage a list of Clients

  Scenario: Successfully create Client
    Given I am logged in
    When I visit the "New Admin Client" page
    And I fill in "Name" with "Saturn Flyer"
    And I click "Add New Client"
    Then I should see "Saturn Flyer"