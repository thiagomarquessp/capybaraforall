Feature: Register

Scenario: Register on Wal Mart

  Given I access the Walmart site
  When I click on Register
  And fill in the fields
  And click Cadastar
  Then my registration will be successfully made
