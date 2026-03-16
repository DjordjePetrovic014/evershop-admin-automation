# EverShop Admin Login Automation Tests

The tests are written using:

- Robot Framework
- SeleniumLibrary
- Chrome WebDriver

## Test Scenarios

The test suite covers both positive and negative login scenarios:

- Valid admin login and logout
- Invalid password
- Invalid email
- Empty password
- Empty email
- Empty email and password
- Password shorter than allowed length
- Invalid email format

## How to Run Tests

Run the tests from the project root using:

```
robot -d results tests/admin_login_tests.robot
```
