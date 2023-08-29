# SQL-School-project
School's database for students' information: 
Created a database with different aspects of a student’s life inside of a campus. This included classes, professors, clubs, dorm housing, … 
Each of these are a different table that had a primary key, and these primary keys will be foreign keys in other tables in order to link these tables together.
- Built database 
- Created tables in the database
- Insert and update records
- Executed queries using a combination of Select, Select Distinct, Where, Group By, Join, Left Join, Cross Join, etc.

Something that I found useful was that sometimes a table had to have 2 primary keys in order to link 2 other tables through it. For example, to link student and classes, we have to have an Enroll table with Student ID and Class ID as PK. The reason for this is because a student can have more than 1 class.

A problem that we ran into when doing this project was that sometimes the link between two tables can’t be created if the name or the formatting of the primary key was not consistent with the responding foreign key. 
