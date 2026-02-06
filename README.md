\# Student Management System



\## Overview



This project is a dynamic web application built using Java Servlets, JSP, JDBC, and MySQL.

It implements a complete admin-driven student management system following the MVC pattern with DAO-based database access.



The goal of this project was to strengthen backend fundamentals by building a full CRUD system from scratch without using frameworks.



---



\## Tech Stack



\* Java (Servlets)

\* JSP

\* JDBC

\* MySQL

\* Apache Tomcat

\* HTML / CSS



---



\## Architecture



The project follows a layered structure:



\* JSP → Presentation Layer

\* Servlets → Controller Layer

\* DAO Classes → Database Access Layer

\* MySQL → Data Storage



Key design decisions:



\* DAO pattern for separation of concerns

\* PreparedStatement for safe database queries

\* Session-based authentication for admin access

\* Forwarding vs redirection handled properly to maintain request state



---



\## Features



\### Admin Module



\* Admin Registration

\* Admin Login

\* Session Management

\* Logout with session invalidation



\### Student Module



\* Create Student

\* Update Student

\* Delete Student

\* View All Students (Dynamic Table)

\* Search Student by ID

\* Status Management (Active / Inactive)



---



\## Database Design



\### Admin Table



\* id (Primary Key, Auto Increment)

\* full\_name

\* email (Unique)

\* password



\### Students Table



\* id (Primary Key, Auto Increment)

\* full\_name

\* dob

\* email

\* phone\_number (Unique)

\* address

\* course

\* department

\* blood\_group

\* gender

\* status



---



\## Key Backend Concepts Implemented



\* Full CRUD operations

\* MVC separation

\* DAO pattern

\* Request forwarding and redirection

\* Session handling

\* Form validation

\* Dynamic JSP rendering using request attributes

\* Multi-action single servlet design (action-based routing)



---



\## How to Run the Project



1\. Clone the repository.

2\. Import the project into Eclipse as a Dynamic Web Project.

3\. Configure Apache Tomcat.

4\. Create a MySQL database.

5\. Update database credentials in `DBUtil.java`.

6\. Deploy the project on Tomcat.

7\. Access the application through the browser.



---



\## Learning Outcomes



This project helped reinforce:



\* How HTTP requests flow through Servlets

\* How to connect Java applications to MySQL using JDBC

\* How to structure a backend application cleanly

\* How to manage sessions securely

\* How to debug and handle server-side errors properly



---



\## Future Improvements



\* Password hashing (e.g., BCrypt)

\* Pagination for student listing

\* Input validation enhancements

\* Role-based access control

\* Soft delete instead of hard delete

\* Migration to Spring Boot for scalability

<img width="1919" height="1042" alt="image" src="https://github.com/user-attachments/assets/a013c51f-7d87-4067-aaf6-4d40ca608ffd" />
