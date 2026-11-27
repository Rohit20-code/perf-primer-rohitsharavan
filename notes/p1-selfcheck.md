# P1 – Self-check

## 1. Testing (P1.1)

**A login page works for one user but takes 20 seconds when 500 users log in at 09:00. Which kind of testing finds that, and why would functional testing miss it?**

Performance testing, specifically a **load test**: 500 users at 09:00 is the expected peak, so we simulate that many virtual users logging in together and measure response time, throughput and error rate.

Functional testing misses it because it checks *what* the system does with one user at a time: right credentials → dashboard, wrong ones → error. That test passes; the login is functionally correct. The defect only appears when many requests compete for the same resources (CPU, DB connections, threads), and functional tests never create that concurrency or measure time against a target.

## 2. Command line (P1.2)

**You type `jmeter` and get 'not recognized'. What two things do you check?**

1. **Is it installed?** Does the JMeter folder exist with `bin\jmeter.bat` inside it (and is Java installed, since JMeter needs it)?
2. **Is its `bin` folder on PATH?** Run `where jmeter` and `echo %PATH%`. If it's missing, add the folder to PATH and open a **new** terminal, because old terminals keep the old PATH.

## 3. Git (P1.3)

**What is the difference between a commit and a push, and why does this course say work that is not pushed does not count?**

- A **commit** saves a snapshot of my changes in my **local** repository, with a message and an author. Only my machine knows about it.
- A **push** uploads my local commits to the **remote** (GitHub), so others can see them, review them and build on them.

Unpushed work doesn't count because nobody else can see it, review it or use it, and it isn't backed up: if my laptop dies, it is lost. The pushed repository is the shared source of truth and the evidence that the work was done.
