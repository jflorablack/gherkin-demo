Feature: Login with email and password
  In order to access my personalized content
  As a visitor
  I want to login with my email and password
  
Background:
  Given I am not logged in
  And I navigate to the home page
  And I navigate to the login area
  And the following valid users exist:
    | person  | email            | password     | personalized content |
    | Alice   | alice@demo.com   | Pickles4me!  | Welcome, Alice!      |
    | Bob     | bob@demo.com     | Gherkin4me2! | Hello, Bob!          |
    | Charlie | charlie@demo.com | iL0veReli$   | Hi, Charlie!         |

Scenario Outline: Successful login with username and password
  And I navigate to the email input
  And I enter <email>
  And I enter <passsword>
  When I try to login
  Then I should see a welcome message
  And I should see <personalized content> for <person>

@errors
Scenario Outline: Clear the password input after a bad password
  And I navigate to the email input
  And I enter a registered email
  And I navigate to the password input
  But I enter a bad password
  When I try to login
  Then I should see an error "Password and email do not match. Please enter your password again or reset your password."
  And I should see a way to reset my password
  And I should see an empty password input
  And I should be in the password input

@errors
Scenario: Show error for blank emails
  And I navigate to the email input
  But I enter a blank email
  When I try to login
  Then I should see an error "Please enter your email"
  And I should see a way to reset my password
  And I should be in the email input

@validation @errors
Scenario Outline: Invalid email address format
  And I navigate to the email input
  But I enter an email>
  Then I should see an error "Please enter a valid email"
  And I should see a way to reset my password
  And I should be in the email input
