# mpcs52553-final
Student Name: Alvin Yu

Student CNET ID: yyu30

Student ID: 10456062

#The solution supports the following user stories and business rules:

(A) User Stories

1. As a visitor, I want to read some marketing propaganda on the home page.

2. As a visitor, I want to sign up for a user account so that I can become a customer.

3. As a user, I want to create a new task.

4. As a user, I want to edit a task.

5. As a user, I want to delete a task

6. As a user, I want to update a task.

7. As a user, I want to see all tasks created by me under My Account.

8. As a user, I want to view all my tasks for a date on the Calendar.

9. As a user, I want to see total time spent on a chosen date. 

(B) Business Rules

1. A task has name, description, duration, level of importance, and completion date.

2. User can only see tasks created by him/herself.

3. Task name, description, duration, importance, and completion date cannot be null.

4. Only signed up users can use the application.

5. Each email address can only be used once for sign-up.

6. User passwords must be securely encrypted.


#Domain models completed: 

1. Task

2. User

#Model validations completed

#Controllers respond to user input, prepare data for views, and implement authorization rules

#Views contain no direct database queries

#One completely RESTful resource: task

#Users can securely sign up, login, and logout

#Authorization rules have been implemented as needed

#seeds.rb created with the following email and password:

1. email: 'cookies@example.com', password: 'cookies'

2. email: 'margaret@example.com', password: 'apollo'

3. email: 'alan@example.com', password: 'enigma'

4. email: 'grace@example.com', password: 'counterclockwise'

#seeds.rb also contains tasks created on "07-30-2017"

#Attributions

Simple-Calendar - https://github.com/excid3/simple_calendar

## Note to Grader

In the milestone, Task model's date column was recommended to be stored in datetime format, however, after analyzing the data, I decided to keep the type as "text" for the following reason:

datetime type will store user input date in "YYYY-MM-DD HH:MM:SS -0500" format, which makes it difficult to make subsequent queries based on user's input date, which is a string and follows "YYYY-MM-DD" format, and even if we convert user input date to datetime format, the date may have different time, making it difficult to query with the date.

In addition, in task's show.html.erb, task's date is used as part of the header, and storing the date into datetime will require additional steps to massage the data which further complicates the solution.

Given the app works well with task's date column being "text" format, I thus decided to leave it unchanged.