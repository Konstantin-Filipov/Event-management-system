# Event-management-system
a database developed via MySql.
# Requirements
MySql WorkBench
# General description of the database created
This is a database for a event company which you can hire to make your event as a client. 
It will store different events for the past year along with their info
# What tables you have?
Client table attributes:
- Id INT (Primary key)
- Cost_id INT (Foreign key)
- Name VARCHAR(50)
- E-mail VARCHAR(50)
- Budget FLOAT

Team table attributes:
- Id INT (Primary key)
- Client_id INT (Foreign key)
- Employee_name VARCHAR(200)
- Setup_deadline DATE

Event table attributes:
- Name VARCHAR(50) (Primary key)
- Team_id INT (Foreign key)
- Cost_id INT (Foreign key)
- Location VARCHAR(50)
- Scheduled_date DATE

Costs table attributes:
- Id INT (Primary key)
- Cost_description VARCHAR(50)
- Overall_cost FLOAT
# Relations
Clients – Teams 1 : 1
One client hires ONE team, ONE team is hired by ONE client.
- Teams – Events 1 : 1
ONE team can only set up ONE event for the day. There cannot be more 
than one team responsible for an event.
- Events – Costs 1 : 1
ONE event has ONE cost in the end.
- Costs – Clients 1 : 1
ONE client has only ONE cost to pay.

