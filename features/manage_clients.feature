Feature: Manage Clients
  In order list our experience
  As a content creator
  I want to manage a list of Clients

  Scenario: Successfully create a page with a location
    Given I am logged in
    When I add a child to the "Venues" page
    And I fill in "Page Title" with "San Jose Museum of Quilts & Textiles"
    And I fill in "Slug" with "quilts-and-textiles"
    And I fill in "Breadcrumb" with "Quilts & Textiles"
    And I fill in "Address" with "520 S 1st St, 95113"
    And I press "Save and Continue Editing"
    Then I should see "37[^a-z]*N"
    And I should see "121[^a-z]*W"