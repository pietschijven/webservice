Feature: compute the monthly account balance by using the JSON API

  As a room mate
  So that I can correctly compute the monthly account balance with my smartphone
  I want to be able to use the JSON API

Background: Expenses and corresponding users in database

  Given the following users exist:
  | name  | salary |
  | Piet  | 1200.0 |
  | Lucia | 1900.0 |
  
  And the following expenses exist:
  | name  | cost  | time_period     | 
  | Piet  | 20.10 | August, 2014    |
  | Piet  | 0.45  | August, 2014    |
  | Piet  | 15.20 | September, 2014 |
  | Lucia | 1.20  | August, 2014    |
  | Lucia | 5.60  | August, 2014    |
  | Lucia | 20.02 | September, 2014 |
  
  And the account balances have been created
  
Scenario: compute the account balance for August, 2014
  When I request the account balance for "August, 2014"
  Then "Lucia" should pay "9.96"
  And "Piet" should pay "-9.96"
  
Scenario: change the existing account balance for August, 2014
  When "Lucia" adds the expense "20.00" for "August, 2014"
  And "Lucia" updates and subsequently requests the account balance for "August, 2014"
  Then "Lucia" should pay "2.22"
  And "Piet" should pay "-2.22"
