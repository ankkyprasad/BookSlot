# Booking App Documentation
The Booking App is a Ruby on Rails application that allows users to book events. Users can view available events, make bookings, and manage their bookings.

## System Requirements
* Ruby version 3.1.0 or higher

* Rails version 7.0.0 or higher

* MySQL database

## Installation

To run the Booking App on your local machine, follow these steps:


1. Clone the repository:
    ```bash
    $ git clone https://github.com/yourusername/booking-app.git
    ```


2. Install the necessary dependencies:

    ```bash
    $ bundle install
    ```

3. Set up the database:
    ```bash
    $ rails db:create
    $ rails db:migrate
    ```

4. Start the server:
    ```
    $ rails server
    ```

5. Open your browser and go to [Localhost](http://localhost:3000)  to access the application.

<br />

## Database Schema
The Booking App uses three tables in the MySQL database:

### **Booking Table:**
<br />

|Column name |Data type |Constraints|
--- | --- | ---|
id|integer|primary key, auto-increment
status|integer|default: 0
first_name|string|
last_name|string|
email|string|
start_at|datetime|
end_at|datetime|
paid|boolean|default: false
email_verified|boolean|default: false
email_verification_token|string|
event_id|bigint|foreign key (references events.id)
created_at|datetime
updated_at|datetime

### **Event Table:**
<br />

|Column name |Data type	|Constraints|
--- | --- | ---|
id|integer|primary key, auto-increment
name|string|not null
location|integer|default: 0
color|string|default: "#000000"
duration|integer|not null
payment_required|boolean|default: false
price|integer|default: 0
user_id|bigint|foreign key (references users.id)
created_at|datetime|
updated_at|datetime|

### **User Table:**
<br />

|Column name |Data type	|Constraints|
--- | --- | ---|
id|integer|primary key, auto-increment
email|string|not null, unique
encrypted_password|string|not null
reset_password_token|string|unique
reset_password_sent_at|datetime|
remember_created_at|datetime|
confirmation_token|string|unique
confirmed_at|datetime|
confirmation_sent_at|datetime|
unconfirmed_email|string|
name|string|not null
created_at|datetime|
updated_at|datetime|