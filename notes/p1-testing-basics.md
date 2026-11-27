# P1.1 – Software Testing Basics

My notes from chapters 1 and 2 of the ISTQB Foundation Level syllabus (v4.0.1). I skimmed it for understanding, not for the exam, so this is how I understand it in my own words.

---

## 1. What testing actually is

Testing is checking software to find problems and to make sure it does what it's supposed to do. It's not only "clicking around to find bugs". It's also about giving the team confidence that the thing is good enough to ship.

Why bother:
- Bugs found before release are much cheaper (and less embarrassing) than bugs users find.
- It tells us whether we actually built what was asked for.
- It lowers the risk of something breaking in production.
- Customers and the business trust a product more when it has been properly tested.

Two pairs of words I kept mixing up:

- **Verification vs validation.** Verification asks "did we build it right?" (does it match the spec?). Validation asks "did we build the right thing?" (does it actually solve the user's problem?). Something can pass verification and still fail validation if the spec itself was wrong.
- **Testing vs debugging.** Testing finds that something is wrong. Debugging is the developer digging into the code to find out *why* and fix it. Testers mostly test; developers mostly debug.

---

## 2. SDLC and where testing sits

SDLC (Software Development Life Cycle) is just the overall journey of building software:

1. **Requirements:** figure out what the customer needs.
2. **Planning:** time, cost, people, risks.
3. **Design:** architecture, database, screens.
4. **Development:** writing the code.
5. **Testing:** checking it against the requirements.
6. **Deployment and maintenance:** releasing it, watching it, fixing things.

How these steps are arranged depends on the model:

- **Waterfall:** one phase after another. Testing mostly happens near the end, which means bugs are found late.
- **V-Model:** every development phase has a matching test phase (requirements ↔ acceptance testing, design ↔ system/integration testing, code ↔ unit testing), so test planning starts early.
- **Agile:** small pieces built and tested in short cycles, with feedback all the way through.

The big takeaway for me: **testing isn't one phase, it runs through the whole lifecycle.**

- In requirements, QA reviews them and spots gaps.
- In planning, QA estimates test effort and flags risks.
- In design, QA reviews designs for testability.
- During development, QA writes test cases and prepares test data.
- In testing, QA runs tests and logs defects.
- At deployment, QA does final checks.
- In maintenance, QA retests fixes and runs regression.

**Shift left** means pulling testing activities earlier. For example, I review the login requirements and notice nobody has defined password rules, before any code is written. Catching that on paper costs minutes. Catching it after release costs a lot more.

**DevOps / CI/CD:** dev and ops work together and automate as much as possible. With CI, every push to GitHub can automatically build the app and run the tests. CD takes it further and automates getting the build ready for release (or deploying it).

---

## 3. Test levels

Test levels are about **how much of the system** you're testing at once.

**Unit testing:** one small piece on its own, like a single function. For example, does the function that generates a Ticket ID always return a unique one? Developers usually write these, using tools like JUnit, NUnit, Jest or pytest.

**Integration testing:** do the pieces talk to each other properly? In my IT Service Hub project that would be: a ticket submitted in Power Apps reaches the Power Automate flow and gets saved in Dataverse. Developers and QA both do this.

**System testing:** the whole app end to end against the requirements. For example: employee logs in, raises a ticket, it gets assigned to a technician, notifications go out. This is mostly QA's job, and it can include functional and non-functional checks.

**Acceptance testing:** does it meet the business need, and will the actual users accept it? For example, the IT manager checks the asset assignment feature and confirms it works the way the company needs. Business users or customers do this, with QA helping.

One thing that cleared up a lot of confusion: **test levels ≠ test types.**
- Levels = scope (unit, integration, system, acceptance).
- Types = what you're checking for (functional, performance, security, usability…).

So you can do performance testing at the system level, or security testing at the integration level, and so on.

---

## 4. Functional vs non-functional testing

**Functional testing** checks *what* the system does: does the feature behave as specified?

My two examples:
1. **Login:** valid username and password gets you in; a wrong password gets rejected with an error.
2. **Ticket creation:** submitting a ticket creates the right record in Dataverse with the details I entered.

(Search, filters, sorting and registration are all functional too.)

**Non-functional testing** checks *how well* it does it: speed, security, usability, compatibility, reliability.

My two examples:
1. **Performance:** can the app handle 500 people using it at the same time and still respond quickly?
2. **Security:** can an employee only see their own data, and not someone else's or the admin pages?

The simplest way I can put it: functional = "does it work?", non-functional = "does it work *well enough*?"

The non-functional types I want to remember:
- **Performance:** how fast and responsive it is.
- **Load:** behaviour under the expected number of users.
- **Stress:** pushing past the limit to see where and how it breaks.
- **Spike:** a sudden jump in traffic.
- **Endurance / soak:** a steady load for a long time (memory leaks show up here).
- **Security:** vulnerabilities and access control.
- **Usability:** is it easy to use?
- **Compatibility:** different browsers, devices, OSes.
- **Reliability:** does it keep working consistently?
- **Scalability:** does it cope as load grows (and when we add more servers)?

---

## 5. Everyday testing vocabulary

**Test case:** a written-down check: preconditions, steps, input, and what should happen. Example:

> **TC_LOGIN_001: Login with valid credentials**
> Precondition: an active user account exists.
> Steps: open login page → enter valid username → enter valid password → click Login.
> Expected: user lands on the dashboard.

**Test data:** the actual values I feed in: valid and invalid passwords, empty fields, duplicate records, boundary values, big datasets. Good test data is half of good testing.

**Test environment:** *where* the testing happens: the servers, database, network and configuration. Typical setup:
- **DEV:** developers' playground.
- **TEST / QA:** where QA runs tests.
- **Staging / UAT:** as close to production as possible, used for final checks.
- **PROD:** the live system real users are on.

(Test data = what I type in. Test environment = where I'm typing it.)

**Build:** a packaged version of the code produced by the build process. A dev changes the login code, produces Build 1.0.2 and hands it to QA. There can be many builds a day.

**Version:** the label that identifies a particular state of the product. Usually `MAJOR.MINOR.PATCH`, like 2.1.3:
- major = big changes, might break compatibility
- minor = new features, still compatible
- patch = bug fixes

**Release:** a version that's been approved and actually handed to users.

How they connect: QA tests Build 1.0.1, finds bugs, devs fix them, QA tests Build 1.0.2, it passes, and that build goes out to users as **Release / Version 1.0**.

**Defect:** the software behaving differently from what it should. Example: the requirement says employees can't open the admin dashboard, but if you paste the admin URL into the browser, it opens. That's a defect.

Related terms:
- **Error:** a mistake a person makes (e.g. a dev forgets a permission check).
- **Defect:** the flaw that mistake leaves in the code.
- **Failure:** what you see when that flawed code runs and misbehaves.

### What makes a good defect report

The goal is that a developer can reproduce it without having to come and ask me anything. So it needs:

1. An ID
2. A clear title (what's broken, where)
3. Environment (which env, browser, OS, build)
4. Preconditions
5. Exact steps to reproduce
6. Expected result
7. Actual result
8. Severity
9. Priority
10. Evidence: screenshots, a screen recording, logs

Example:

> **BUG-001: Employee can open the admin dashboard without admin rights**
> Environment: TEST, Chrome on Windows 11
> Precondition: logged in as an employee
> Steps: log in as employee → paste the admin dashboard URL → press Enter
> Expected: access denied
> Actual: admin dashboard loads
> Severity: High · Priority: High (it's a security hole)

**Severity vs priority:** severity is how badly it breaks things; priority is how soon it needs fixing. They don't always match. A typo on the payment page is low severity but might be high priority because customers see it. A crash in a feature almost nobody uses is high severity but might wait.

---

## 6. How QA works in a Scrum team

Scrum is an Agile way of working in short, fixed cycles called **sprints** (a month or less, two weeks is common). The roles:
- **Product Owner:** owns the backlog and decides what's most valuable.
- **Scrum Master:** helps the team work well and follow Scrum.
- **Developers:** everyone building the increment, **testers included**.

A sprint goes roughly: Sprint Planning (pick the work and set a goal) → Daily Scrum (quick daily sync) → build and test → Sprint Review (show stakeholders) → Retrospective (how can we work better?).

**User story:** a feature written from the user's side: *"As an employee, I want to raise an IT support ticket so that I can get help with technical problems."*

**Acceptance criteria:** the specific conditions that story has to meet to be accepted. For the ticket story: user must be logged in, title and description are mandatory, the ticket saves, a unique ID is generated, and the employee can see their ticket afterwards. These turn almost directly into my test cases.

**Definition of Done (DoD):** the team's shared checklist for *any* item to count as finished: code reviewed, unit and integration tests passing, acceptance criteria met, no open critical bugs, docs updated.

The difference: acceptance criteria are specific to one story; the DoD applies to everything.

**Regression testing:** after a change, checking that the stuff that used to work still works. For example, after a login fix, I recheck employee login, admin login and ticket creation.

**Release:** shipping an approved increment to users. It doesn't have to happen every sprint; that's up to the release plan.

### My paragraph on QA in Scrum

In a Scrum team, QA isn't a gate at the end; we're part of the team from the start of the sprint. During planning and refinement I read the user stories, ask questions and help pin down clear acceptance criteria. While developers build, I write test cases and get test data ready, so when a build lands I can test it straight away, log defects with clear steps, and retest the fixes along with some regression. A story is only "done" when it meets its acceptance criteria *and* the team's Definition of Done. At the Sprint Review we show the working increment to stakeholders, and whenever the Product Owner decides it's ready, it goes out as a release.

---

## 7. Where performance testing fits

Performance testing is a **non-functional** test type. It's about how fast and stable the app is under a given load: response times, how many users it can take, and how much CPU and memory it eats.

The classic example: the login page works perfectly for one person but takes 20 seconds when 500 people log in at 9 a.m. Nothing is "functionally" wrong, but users would still say it's broken.

The flavours:
- **Load testing:** the expected load (e.g. 500 users). *Can it handle a normal busy day?*
- **Stress testing:** keep adding users past 500 until it degrades or breaks. *Where's the limit, and does it fail gracefully?*
- **Spike testing:** jump from 50 to 1,000 users suddenly. *Can it handle a rush?*
- **Endurance / soak testing:** 300 users for 8 hours. *Does it stay stable, or slowly leak memory?*
- **Volume testing:** a huge amount of data, like searching 5 million records. *Does it cope with big data?*
- **Scalability testing:** add more capacity and see if performance grows with it. *Can it grow?*

Numbers I'll be watching:
- **Response time:** how long a request takes to come back.
- **Throughput:** requests or transactions handled per second.
- **Latency:** the delay before a response starts.
- **Error rate:** failed requests ÷ total requests × 100.
- **Concurrent users:** how many are active at the same moment.
- **Resource use:** CPU, memory, disk, network on the server.

**JMeter** is the tool this course uses. It fires requests at the app from simulated "virtual users" and records what happens. The main parts:
- **Test Plan:** the whole test.
- **Thread Group:** how many virtual users, and how fast they ramp up.
- **HTTP Request sampler:** the actual request sent.
- **Listeners:** collect and show results.
- **Assertions:** check that responses are correct, not just fast.

One caveat to remember: virtual users aren't real people in real browsers, and results depend heavily on the test setup and environment. A test on a weak QA server doesn't tell you exactly how production will behave.

### What performance testing answers that functional testing can't

Functional testing tells me the login *works*. Performance testing tells me:
- How fast does it respond?
- How many users can it handle at once?
- At what point does it start slowing down or failing?
- Does it stay stable over hours?
- What happens if traffic suddenly spikes?
- Is it burning through CPU or memory?

Same login page, two different questions. Functional: one user enters valid details and gets the dashboard. Performance: 500 users do that at once while I measure response time, throughput and errors.

---

## 8. Self-check

**Q: A login page works for one user but takes 20 seconds when 500 users log in at 09:00. Which kind of testing finds that, and why would functional testing miss it?**

**Performance testing**, and more specifically **load testing**, since 500 users at 9 a.m. is the normal expected peak.

Functional testing misses it because it only checks that login gives the right result, usually with one user at a time. With one user it passes fine. The slowdown only shows up when hundreds of requests hit the server together and compete for resources, and functional tests never create that situation or measure timing.

---

## 9. What I'm taking away

- Testing is about finding problems early **and** building confidence, and it happens throughout the lifecycle, not just at the end.
- Levels (unit → integration → system → acceptance) describe scope; types (functional, performance, security…) describe what you're checking.
- Functional = does it work; non-functional = does it work well enough.
- A good test case and a good bug report both come down to being clear enough that someone else can repeat them.
- In Scrum, QA is part of the team from day one, guided by acceptance criteria and the Definition of Done.
- Performance testing is where this course is heading, and JMeter is the tool for it.
