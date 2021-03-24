# FlyAwayProject

FlyAway is a ticket-booking portal that lets users book flights on this website.

Website displays the following features:
•	A search form in the homepage to allow entry of travel details, like the date of travel, source, destination, and the number of persons.
•	Based on the travel details entered, it shows the available flights with their ticket prices.
•	Once a person selects a flight to book, they are taken to a register page where they must fill in their personal details. 
•	In the next page, they are shown the flight details of the flight that they are booking, and the payment is done via a dummy payment gateway.
•	On completion of the payment, they are shown a confirmation page with the details of the booking.   

There is an admin backend with the following features:
•	An admin login page where the admin can change the password after login, if he wishes.
•	A master list of places for source and destination.
•	A master list of airlines.
•	A list of flights where each flight has a source, destination, airline, and ticket price

# Core concepts used in project:

Servlets Session Management, Hibernate, CRUD operations, SQL Queries, Many to Many, Many to One relationships, Table Joins, Filters, Subqueries, Transaction Control.

# User Stories

As a user, I want to be able to search for available flights (Date of travel, source, destination, number of seats available, price), So that I can select a flight easily
As a user, I want to see the available flights with their ticket prices, so that I can choose the best option for me
As a ticket-booking manager, I want to be able users to record their person details, so that I know who is on what flight
As a ticket-booking manager, I want users to confirm their flight details prior to payment, so that we can avoid refunds
As a ticket-booking manager, I want users to pay online, so we can receive payment immediately
As a user, I want a confirmation page with proof of payment and details of my booking, so that I can remember the finer details on the day of my flight
As an admin, I want to be able to change my password after login, so that I can keep my account secure
As an admin, I want to view a master list of places for source and destination, so that I know all of the places my booking portal offers
As an admin, I want a view a list of airlines, so that I know what airlines are available to my customers
As an admin, I want to view a list of all flights where each flight has a source, destination, airline, ticket price, and number of seats empty, so that I know which flights to advertise more heavily

