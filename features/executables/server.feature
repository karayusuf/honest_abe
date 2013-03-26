Feature: honest_abe server

  Scenario: Start the server
    Given I run the command "honest_abe server"
    When I visit the url "http://localhost:3333"
    Then I should see the root page
