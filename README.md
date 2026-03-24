# EverShop Admin Automation Tests

## Tech Stack

![Robot Framework](https://img.shields.io/badge/Robot_Framework-000000?style=for-the-badge&logo=robotframework&logoColor=white)
![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white)
![Chrome](https://img.shields.io/badge/Chrome_WebDriver-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

---

## 📌 Project Overview

This project contains automated UI tests for the EverShop Admin panel using **Robot Framework** and **SeleniumLibrary**.

The framework is designed using the **Page Object Model (POM)** to ensure clean structure, reusability, and maintainability.

---

## 🧩 Project Structure

The project follows a layered architecture:

- **Page Objects**
  - Contain locators and page-level actions  
  - Example: login, products, categories  

- **Keywords**
  - Contain reusable business logic and workflows  
  - Example: login flow, product creation, category management  

- **Tests**
  - Contain clean test scenarios  
  - Focus on behavior and validation only  

- **Common**
  - Shared reusable web interaction keywords  
  - Example: click, input, wait wrappers  

---

## Test Environment

The tests are executed against a locally running EverShop admin instance.

Base URL used in the project:

`http://localhost:3000/admin/login`

The application is started locally using a Docker-based environment.

---

## Admin Login Test Scenarios

The test suite covers both positive and negative login scenarios:

- Valid admin login and logout
- Invalid password
- Invalid email
- Empty password
- Empty email
- Empty email and password
- Password shorter than allowed length
- Invalid email format

Run login tests:
- robot -d results tests/admin_login_tests.robot

## Product Management Test Scenarios

The test suite covers product-related flows in the admin panel:

- Open products page
- Open new product form
- Create product with dynamic data (FakerLibrary)
- Search and open created product
- Edit product (price update)
- Delete product from product list
- (E2E: Create → Verify → Delete → Verify removal)
- Validation Scenarios
- Duplicate SKU should fail
- Product without name should fail
- Product without SKU should fail
- Product without price should fail

Run product tests:
- robot -d results tests/catalog/products_tests.robot

## Categories Test Scenarios

The test suite covers category management flows:

- Open Categories page
- Open New Category form
- Create category with dynamic data
- Delete category
- Verify category presence in list

Run categories tests:
- robot -d results tests/catalog/categories_tests.robot