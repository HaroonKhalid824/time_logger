# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Written Response

### ● Please describe your process for approaching the code challenge. What kind of planning did you do? Did your plans change as you began coding?

I started with DB schema and identified the tables. Then I did some brain storming regarding the backend structure and user flow of time logging. Initially, I thought about having separate entries for each attendance(check-in/check-out). But then I thought about the dependency of both events on each other. A check-out cannot take place if the user haven't checked-in yet. So I ended up having a single table for attendance and checking the event possibility on each attendance log, e.g for checkout, I simply get the last attendance logged by the user and log the time. System throws user friendly errors if the checkout is performed without logging the check-in first(vise versa). 

In other implementation, I'd have to traverse around all attendances of the user and then get latest one, then log the checkout event for it. In this implementation, duration tracking would have been difficult. But in my current implementation, if we plan on logging the duration(hours worked), we can simply do that without any database extensive operation.

I've used devise gem for the authentication. Currently, the system can accept a new user by signing up only. I didn't understand the other requirement stating 'adding user names to each timesheet entry'

I've also written specs for the attendance model.

### ● Describe the schema design you chose. Why did you choose this design? What other alternatives did you consider?

Initially I thought about having User, Attendance and AttendanceType table. But as explained above, this implementation was not efficient in terms of duration tracking and validations. So I changed the schema to only have two models User and Attendance. A user completes the sign-up process and start logging the attendance. An attendance event can be edited as well.

### ● If you were given another day to work on this, how would you spend it? What if you were given a month?

If I was given another day to work on this, I'd introduce the support of activeadmin to perform administrative tasks and data insights. I'd also work on setting up the email notifications for authentication work flow and improve the UI for pagination(I did some customization but heroku build was unable to locale linkBuilder module from will_paginate So, I had to ship it with default UI of will_paginate) 

If I was given a month to work on it, I'd work on following things

1: I'd introduce the duration concept to calculate the hours worked of a user on weekly and monthly basis. This can help in billing if the teachers are charging on hourly basis or performance evaluation(punctuality) otherwise. 
2: I was confused about the validation of check-in < check-out. I'd clarify that and incorporate that as well, if any changed required.
3: I'd introduce the monthly notification of attendance time sheet that gets fired on each month end. 
4: After some discussion with the stake holders, location tracking can be incorporated. System start logging the location as well. This way, we can verify that attendance is being marked from the expected locations only. 
5: Add some validation to not have future attendance logs. Currently, during editing, a user can log attendance for any date/time.
6: Any possible user feedback which comes our way and we can improve the system on that. 


Thank you for reading this. Hoping to hear from you. 