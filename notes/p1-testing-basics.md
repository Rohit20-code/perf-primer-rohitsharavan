
# P1.1 – Software Testing Basics

## 1. Software Testing Essentials

### What is Software Testing?

Software testing is the process of evaluating software to identify defects and verify whether it meets specified requirements.

It helps ensure that software behaves as expected, satisfies user needs and meets quality standards.

### Why is Software Testing Important?

1. Identifies defects before software reaches users.
2. Verifies whether the application meets requirements.
3. Reduces risks associated with software failures.
4. Improves software quality, reliability and usability.
5. Builds confidence among customers and stakeholders.

### Verification vs Validation

- Verification: Checks whether the product is being built correctly according to its specifications.
- Validation: Checks whether the correct product is being built to satisfy user needs.

### Testing vs Debugging

- Testing identifies failures and defects in software.
- Debugging investigates the cause of a defect and helps fix it.

Testing is generally performed by testers and developers, while debugging is primarily performed by developers.

---

## 2. Software Development Life Cycle (SDLC)

### What is SDLC?

SDLC stands for Software Development Life Cycle. It is a structured process followed to plan, design, develop, test, deploy and maintain software applications.

### Stages of SDLC

1. Requirement Analysis:
   Understanding the customer's needs and identifying the features required in the application.

2. Planning:
   Estimating project cost, time, resources and potential risks.

3. Design:
   Preparing application architecture, database structures, UI designs and technical specifications.

4. Development:
   Writing code and implementing the required functionalities.

5. Testing:
   Verifying the application against requirements and identifying defects.

6. Deployment and Maintenance:
   Releasing the application to users, monitoring its performance and fixing issues.

### SDLC Models

**Waterfall Model**

A sequential development model in which each phase is generally completed before the next phase begins. Testing mainly happens after development, although reviews can happen earlier.

**Agile Model**

An iterative development approach in which software is developed and tested in smaller increments. Teams deliver functionality through repeated iterations and incorporate feedback.

**V-Model**

A development model in which each development phase has a corresponding testing phase. Test planning begins early in the development lifecycle.

### Testing Throughout SDLC

Testing is not limited to the testing phase.

QA activities can happen throughout SDLC:

- Requirements: Review requirements and identify missing information.
- Planning: Estimate testing effort and identify risks.
- Design: Review application designs and architecture.
- Development: Prepare test cases and test data.
- Testing: Execute test cases and report defects.
- Deployment: Perform final checks and verify release readiness.
- Maintenance: Test bug fixes and perform regression testing.

### Shift Left Testing

Shift Left means moving testing activities earlier in the software development lifecycle to identify defects as early as possible.

Example: A tester reviews the login requirements and identifies missing password validation rules before developers start coding.

Finding defects early generally reduces the cost and effort required to fix them.

### DevOps

DevOps encourages collaboration between development and operations teams to improve software delivery.

It uses automation, continuous integration and continuous delivery/deployment practices.

- CI (Continuous Integration): Frequently integrating code changes and automatically building and testing them.
- CD (Continuous Delivery/Deployment): Automating the preparation or deployment of software releases.

Example: When a developer pushes code to GitHub, an automated pipeline can build the application and execute tests.

---

## 3. Test Levels

Test levels represent different scopes of software testing.

### 1. Unit Testing

Unit testing checks individual components, functions or methods independently to verify that they work correctly.

Example: Testing a function that generates a unique Ticket ID.

Usually performed by developers.

Common tools include JUnit, NUnit, Jest and pytest.

### 2. Integration Testing

Integration testing verifies whether multiple components or systems communicate and work together correctly.

Example: Verifying that a ticket submitted through Power Apps is correctly received by a Power Automate flow and stored in Dataverse.

Performed by developers and QA engineers.

### 3. System Testing

System testing verifies the complete integrated application against its specified requirements.

Example: Testing the complete IT Service Hub workflow, from employee login and ticket creation to technician assignment and notification.

Usually performed by QA engineers.

System testing can include both functional and non-functional testing.

### 4. Acceptance Testing

Acceptance testing checks whether the software meets business requirements and is acceptable for its intended users.

Example: An IT manager verifies whether the asset assignment functionality satisfies the company's requirements.

Usually performed by business users, customers or their representatives, with QA support.

### Difference Between Test Levels and Test Types

Test levels describe the scope of testing, whereas test types describe the testing objective or quality characteristic.

Examples of test levels:
- Unit Testing
- Integration Testing
- System Testing
- Acceptance Testing

Examples of test types:
- Functional Testing
- Performance Testing
- Security Testing
- Usability Testing

---

## 4. Functional vs Non-functional Testing

### Functional Testing

Functional testing verifies whether the application performs the functions specified in its requirements.

It checks what the software does.

Examples:

1. Login Validation:
   Checking whether valid credentials allow users to log in and invalid credentials are rejected.

2. Ticket Creation:
   Checking whether submitting a ticket creates the correct record in Dataverse with the expected details.

Other examples include search, filtering, sorting, registration and asset assignment.

### Non-functional Testing

Non-functional testing evaluates how well the application performs its functions.

It focuses on quality characteristics such as performance, security, usability, compatibility and reliability.

Examples:

1. Performance Testing:
   Checking whether an application can handle 500 simultaneous users with acceptable response times.

2. Security Testing:
   Checking whether employees can access only the information they are authorised to view.

### Difference Between Functional and Non-functional Testing

- Functional testing checks whether the application performs the correct operations.
- Non-functional testing checks the quality and effectiveness of how those operations are delivered.

### Types of Non-functional Testing

- Performance Testing: Measures application speed and responsiveness.
- Load Testing: Checks application behaviour under expected workloads.
- Stress Testing: Checks application behaviour beyond its normal operating capacity.
- Spike Testing: Checks how the application handles sudden workload changes.
- Endurance Testing: Checks application stability under sustained workloads.
- Security Testing: Identifies vulnerabilities and access-control weaknesses.
- Usability Testing: Evaluates how easy the application is to use.
- Compatibility Testing: Checks behaviour across different browsers, devices and operating systems.
- Reliability Testing: Evaluates consistent and dependable operation.
- Scalability Testing: Evaluates the ability to handle increasing workloads.

---

## 5. Essential Testing Terminology

### 1. Test Case

A test case is a documented set of preconditions, inputs, execution steps and expected results used to verify a particular functionality.

Example:

Test Case ID: TC_LOGIN_001

Scenario: Login using valid credentials.

Precondition: An active user account exists.

Test Steps:
1. Open the login page.
2. Enter a valid username.
3. Enter a valid password.
4. Click Login.

Expected Result: The user should successfully access the dashboard.

### 2. Test Data

Test data is the information used as input while executing test cases.

Examples include:

- Valid credentials.
- Invalid passwords.
- Empty values.
- Duplicate records.
- Boundary values.
- Large datasets.

Test data helps verify how the application behaves with different inputs.

### 3. Test Environment

A test environment is the hardware, software, network, database and configuration setup in which testing is performed.

Examples include:

- Development (DEV): Used for development and initial verification.
- Testing (TEST/QA): Used by QA engineers to execute tests.
- Staging/UAT: A production-like environment used for final validation.
- Production (PROD): The live environment used by actual customers.

Test data refers to the information entered during testing, whereas the test environment refers to where testing is performed.

### 4. Build

A build is a packaged or compiled version of software generated from source code through a build process.

Example: A developer makes changes to the login functionality and generates Build 1.0.2 for QA testing.

A build may be generated multiple times during development.

### 5. Release

A release is an approved software version or increment made available to users or customers.

Example: The company releases Employee Portal Version 1.0 to production.

A release may contain one or more builds, depending on the delivery process.

### 6. Version

A version identifies a particular edition or state of a software product.

Semantic Versioning commonly follows this format:

MAJOR.MINOR.PATCH

Example: Version 2.1.3

- Major: Significant changes that may introduce compatibility issues.
- Minor: New functionality that is generally backward compatible.
- Patch: Bug fixes and smaller corrections.

### Difference Between Build, Release and Version

- Build: A packaged software output generated from source code.
- Version: Identifies a particular edition of the software.
- Release: Makes an approved software version available to users.

Example:

A developer generates Build 1.0.1 and QA tests it. After fixes, Build 1.0.2 is generated. The approved application is released as Version 1.0.

### 7. Defect

A defect is a flaw or imperfection in a software component or system that can cause it to behave differently from the expected requirements.

Example:

Requirement: Employees must not access the admin dashboard.

Actual Behaviour: An employee can access the admin dashboard by modifying the URL.

This is a defect because the actual behaviour violates the requirement.

### Error, Defect and Failure

- Error: A human action that produces an incorrect result.
- Defect: A flaw in a software component or system.
- Failure: An event in which software does not perform as expected during execution.

### What Should a Good Defect Report Contain?

A good defect report should include:

1. Defect ID.
2. Clear title and description.
3. Environment details.
4. Preconditions.
5. Steps to reproduce.
6. Expected result.
7. Actual result.
8. Severity.
9. Priority.
10. Supporting attachments such as screenshots, recordings or logs.

Example:

Defect ID: BUG-001

Title: Employee can access the admin dashboard without admin permissions.

Environment: TEST environment, Chrome on Windows 11.

Precondition: Employee account is logged in.

Steps to Reproduce:
1. Log in using employee credentials.
2. Copy the admin dashboard URL.
3. Paste it into the browser.
4. Press Enter.

Expected Result: Access should be denied.

Actual Result: Admin dashboard is displayed.

Severity: High.

Priority: High, assuming the team needs this security defect fixed urgently.

### Severity vs Priority

- Severity describes how seriously the defect affects the application.
- Priority describes how urgently the defect should be fixed.

Example:

A minor spelling mistake on an important payment screen may have low severity but high priority.

A serious issue affecting a rarely used feature may have high severity but lower priority, depending on business impact.

---

## 6. How QA Works in a Scrum Team

### Scrum

Scrum is an Agile framework in which teams work in short, fixed-length iterations called Sprints to deliver usable product increments.

### Scrum Team Accountabilities

1. Product Owner:
   Maximises product value and manages the Product Backlog.

2. Scrum Master:
   Helps the team understand and apply Scrum and supports team effectiveness.

3. Developers:
   Create the product increment. This includes software developers, testers and other specialists.

### Sprint

A Sprint is a fixed-length period of one month or less during which the team works towards a Sprint Goal.

Many software teams use two-week Sprints.

Activities include:

- Sprint Planning: Selecting work and establishing the Sprint Goal.
- Daily Scrum: Inspecting progress and adapting the plan.
- Development and Testing: Building and verifying functionality.
- Sprint Review: Inspecting the increment with stakeholders.
- Sprint Retrospective: Identifying improvements to the team's working process.

### User Story

A User Story describes a feature from the user's perspective.

Common format:

"As a [type of user], I want [functionality], so that [benefit]."

Example:

"As an employee, I want to raise an IT support ticket so that I can report technical problems and receive assistance."

### Acceptance Criteria

Acceptance Criteria are specific conditions that a user story must satisfy to be accepted.

Example for ticket creation:

- Employee must be logged in.
- Ticket title must be mandatory.
- Ticket description must be provided.
- Ticket must be saved successfully.
- A unique Ticket ID must be generated.
- Employee must be able to view the submitted ticket.

QA uses these criteria to prepare and execute test cases.

### Definition of Done

Definition of Done is a shared set of quality criteria that must be satisfied before work is considered complete.

Examples:

- Code is completed and reviewed.
- Required unit tests are passed.
- Required integration tests are passed.
- Acceptance criteria are satisfied.
- No unresolved critical defects remain.
- Documentation is updated where necessary.

### Difference Between Acceptance Criteria and Definition of Done

- Acceptance Criteria are specific to an individual user story and define what the feature must achieve.
- Definition of Done provides shared quality standards for completed work.

### QA's Role in Scrum

QA participates throughout the Sprint.

1. Reviews requirements and user stories.
2. Clarifies acceptance criteria.
3. Identifies positive and negative test scenarios.
4. Prepares test cases and test data.
5. Collaborates with developers during implementation.
6. Executes tests when builds are available.
7. Reports defects with reproduction steps.
8. Retests fixes and performs regression testing.
9. Verifies that acceptance criteria and Definition of Done are satisfied.
10. Supports the team in reviewing the increment before release.

### Regression Testing

Regression testing checks whether software changes have unintentionally affected previously working functionality.

Example:

After a developer fixes employee login validation, QA checks whether employee login, admin login and ticket creation still work correctly.

### Release

A release makes an approved software version or increment available to users.

A release does not necessarily have to happen at the end of every Sprint.

### One-Paragraph Summary: QA in Scrum

In a Scrum team, QA works collaboratively with developers and the Product Owner throughout each Sprint. QA reviews user stories and acceptance criteria, prepares test cases and test data, executes tests, reports defects and verifies fixes. The team follows its Definition of Done to ensure that completed work meets the required quality standards. During Sprint Reviews, the increment is inspected with stakeholders, and approved functionality can be released to users according to the product's release plan.

---

## 7. Where Performance Testing Fits

### What is Performance Testing?

Performance testing is a type of non-functional testing that evaluates the responsiveness, speed, stability, scalability and resource utilisation of an application under a defined workload.

It checks how well an application performs when users access it.

Example:

A login application works correctly for one user but takes 20 seconds when 500 users attempt to log in simultaneously.

This indicates a performance problem.

### Types of Performance Testing

**1. Load Testing**

Checks application behaviour under an expected or specified workload.

Example: Testing an application with 500 simultaneous users.

Question answered: Can the application handle its expected workload?

**2. Stress Testing**

Checks application behaviour beyond its normal operating capacity.

Example: Increasing the workload beyond 500 users until performance degrades.

Question answered: How does the application behave beyond its expected capacity?

**3. Spike Testing**

Checks how an application handles sudden increases or decreases in workload.

Example: Increasing traffic suddenly from 50 to 1,000 users.

Question answered: Can the application handle sudden traffic spikes?

**4. Endurance Testing (Soak Testing)**

Checks application stability under a sustained workload over an extended period.

Example: Running 300 virtual users continuously for 8 hours.

Question answered: Can the application remain stable over a long period?

**5. Volume Testing**

Checks application performance when handling large quantities of data.

Example: Searching and retrieving records from a database containing 5 million records.

Question answered: Can the application handle large volumes of data efficiently?

**6. Scalability Testing**

Checks how effectively an application handles increasing workloads when additional resources or capacity are provided.

Example: Increasing server capacity to support a growing number of concurrent users.

Question answered: Can the application scale as workload increases?

### Important Performance Testing Metrics

1. Response Time:
   Time taken for an application or server to respond to a request.

2. Throughput:
   Number of transactions or requests processed per unit of time.

3. Latency:
   Delay before a response or operation begins, depending on the measurement definition.

4. Error Rate:
   Percentage of requests that fail.

   Error Rate = (Failed Requests / Total Requests) × 100

5. Concurrent Users:
   Number of users performing activities simultaneously.

6. Resource Utilisation:
   Amount of CPU, memory, disk and network resources consumed.

### Role of Apache JMeter

Apache JMeter is a performance testing tool used to generate simulated workloads and measure application behaviour.

Important JMeter components include:

- Test Plan: Container for the complete test.
- Thread Group: Configures virtual users and their execution.
- HTTP Request Sampler: Sends HTTP requests to the application.
- Listener: Collects and displays test results.
- Assertions: Checks whether responses satisfy expected conditions.

Example:

A JMeter test can simulate 500 virtual users accessing an employee login API and measure response times, throughput and error rates.

JMeter simulates requests using virtual users. It does not necessarily behave exactly like real people interacting through browsers.

Performance test results depend on the test configuration and environment.

### Where Performance Testing Fits

Performance testing is a form of non-functional testing. It can be performed at different test levels, particularly system testing, and throughout the software lifecycle.

Functional testing checks whether the application performs the correct operations.

Performance testing answers questions that functional testing alone cannot answer:

1. How quickly does the application respond?
2. How many simultaneous users can it support?
3. How much traffic can it handle before performance degrades?
4. Does the application remain stable under sustained workloads?
5. What happens when traffic suddenly increases?
6. Does the application consume excessive CPU, memory or network resources?

### Functional Testing vs Performance Testing Example

Scenario: An employee login application.

Functional Testing:
- A user enters valid credentials.
- The application authenticates the user.
- The dashboard opens successfully.

This verifies that login functionality works correctly.

Performance Testing:
- 500 users attempt to log in simultaneously.
- Response times are measured.
- Throughput and error rates are analysed.
- Application stability is evaluated.

This verifies how well the application performs under concurrent workload.

---

## 8. Final Self-Check

Question:

A login page works for one user but takes 20 seconds when 500 users log in at 09:00. Which kind of testing finds that, and why would functional testing miss it?

Answer:

Performance testing identifies this problem because it evaluates application responsiveness and stability under concurrent workloads.

More specifically, load testing would be appropriate if 500 users represent the expected workload.

Functional testing would not necessarily identify this problem because it checks whether the login functionality works correctly, not whether it responds quickly under heavy traffic.

The login feature works for one user, but the application struggles when 500 users access it simultaneously.

---

## 9. Overall Key Takeaways

1. Software testing evaluates software quality and identifies defects.
2. SDLC describes the complete process of developing and maintaining software.
3. Testing happens throughout the software development lifecycle.
4. Unit testing checks individual components.
5. Integration testing checks communication between components.
6. System testing checks the complete application.
7. Acceptance testing checks whether business requirements are satisfied.
8. Functional testing checks what the application does.
9. Non-functional testing checks how well the application performs.
10. Test cases, test data and test environments are essential for executing tests.
11. Defect reports help developers understand and reproduce problems.
12. QA collaborates with the Scrum team throughout each Sprint.
13. Performance testing evaluates application behaviour under different workloads.
14. Apache JMeter can simulate virtual users and measure performance metrics.

---

**End of P1.1 – Software Testing Essentials**
