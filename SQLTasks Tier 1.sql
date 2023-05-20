/* Welcome to the SQL mini project. You will carry out this project partly in
the PHPMyAdmin interface, and partly in Jupyter via a Python connection.

This is Tier 1 of the case study, which means that there'll be more guidance for you about how to 
setup your local SQLite connection in PART 2 of the case study. 

The questions in the case study are exactly the same as with Tier 2. 

PART 1: PHPMyAdmin
You will complete questions 1-9 below in the PHPMyAdmin interface. 
Log in by pasting the following URL into your browser, and
using the following Username and Password:

URL: https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

In this case study, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */


/* QUESTIONS 
/* Q1: Some of the facilities charge a fee to members, but some do not.
Write a SQL query to produce a list of the names of the facilities that do. */

SELECT name
FROM `Facilities`
WHERE membercost != 0;

A1: Tennis Court 1, Tennis Court 2, Massage Room 1, Massage Room 2, Squash Court

/* Q2: How many facilities do not charge a fee to members? */

SELECT COUNT(name)
FROM `Facilities`
WHERE membercost = 0;

A2: 4

/* Q3: Write an SQL query to show a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost.
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */


A3:Springboard PHPMyadmin Server/country_club/Facilities/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&db=country_club&table=Facilities&pos=0

   Showing rows 0 -  8 (9 total, Query took 0.0003 seconds.)


SELECT *
FROM `Facilities`
WHERE membercost <  0.2 * monthlymaintenance;


facid	name	membercost	guestcost	initialoutlay	monthlymaintenance	expense_label	
0	Tennis Court 1	5.0	25.0	10000	200	expensive	
1	Tennis Court 2	5.0	25.0	8000	200	expensive	
2	Badminton Court	0.0	15.5	4000	50	cheap	
3	Table Tennis	0.0	5.0	320	10	cheap	
4	Massage Room 1	9.9	80.0	4000	3000	expensive	
5	Massage Room 2	9.9	80.0	4000	3000	expensive	
6	Squash Court	3.5	17.5	5000	80	cheap	
7	Snooker Table	0.0	5.0	450	15	cheap	
8	Pool Table	0.0	5.0	400	15	cheap	


/* Q4: Write an SQL query to retrieve the details of facilities with ID 1 and 5.
Try writing the query without using the OR operator. */

Springboard PHPMyadmin Server/country_club/Facilities/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&db=country_club&table=Facilities&pos=0

   Showing rows 0 -  1 (2 total, Query took 0.0004 seconds.)


SELECT *
FROM `Facilities`
WHERE facid IN (1,5);


facid	name	membercost	guestcost	initialoutlay	monthlymaintenance	expense_label	
1	Tennis Court 2	5.0	25.0	8000	200	expensive	
5	Massage Room 2	9.9	80.0	4000	3000	expensive	


/* Q5: Produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100. Return the name and monthly maintenance of the facilities
in question. */

Springboard PHPMyadmin Server/country_club/Facilities/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&db=country_club&table=Facilities&pos=0

   Showing rows 0 -  3 (4 total, Query took 0.0007 seconds.)


SELECT name, monthlymaintenance
FROM `Facilities`
WHERE expense_label IN ('cheap','expensive')
AND monthlymaintenance > 100;


name	monthlymaintenance	
Tennis Court 1	200	
Tennis Court 2	200	
Massage Room 1	3000	
Massage Room 2	3000	



/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Try not to use the LIMIT clause for your solution. */

Springboard PHPMyadmin Server/country_club/Members/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&pos=0&db=country_club&table=Members

   Showing rows 0 -  0 (1 total, Query took 0.0003 seconds.)


SELECT firstname,surname,MAX(joindate)
FROM `Members`
WHERE memid !=0;



Darren	Smith	2012-09-26 18:08:45	


/* Q7: Produce a list of all members who have used a tennis court.
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

Springboard PHPMyadmin Server/country_club/Members/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&db=country_club&table=Bookings&sql_query=SELECT+%2A+FROM+%60Bookings%60%0D%0ALEFT+JOIN+%60Facilities%60%0D%0AUSING+%28facid%29%0D%0AWHERE+name+LIKE+%22Tennis%25%22++%0AORDER+BY+%60Bookings%60.%60facid%60+ASC&sql_signature=548de02b6acea64f4c9bfeca77411eaac0155266c381672d0204dd6e29291f59&session_max_rows=25&is_browse_distinct=0

   Showing rows 0 - 24 (26 total, Query took 0.0372 seconds.) [firstname: ANNE... - TIMOTHY...]


SELECT DISTINCT firstname, surname
FROM `Members`
	INNER JOIN `Bookings`
	USING (memid)
	INNER JOIN `Facilities`
    USING (facid)
	WHERE name LIKE "%Tennis Court%" AND memid !=0
ORDER BY firstname ASC;


firstname   	surname	
Anne	Baker	
Burton	Tracy	
Charles	Owen	
Darren	Smith	
David	Pinker	
David	Farrell	
David	Jones	
Douglas	Jones	
Erica	Crumpet	
Florence	Bader	
Gerald	Butters	
Henrietta	Rumney	
Jack	Smith	
Janice	Joplette	
Jemima	Farrell	
Joan	Coplin	
John	Hunt	
Matthew	Genting	
Millicent	Purview	
Nancy	Dare	
Ponder	Stibbons	
Ramnaresh	Sarwin	
Tim	Boothe	
Tim	Rownam	
Timothy	Baker	



/* Q8: Produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30. Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

Springboard PHPMyadmin Server/country_club/Bookings/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&pos=0&db=country_club&table=Bookings

   Showing rows 0 - 11 (12 total, Query took 0.0105 seconds.)


SELECT name,
	CONCAT(firstname, ' ' ,surname) AS fullname,
    IF(memid = 0, guestcost * slots, membercost * slots) AS cost
FROM 
    `Bookings`
INNER JOIN 
    `Facilities` USING (facid)
INNER JOIN
	`Members` USING (memid)
WHERE 
    starttime LIKE "%2012-09-14%"
    AND IF(memid = 0, guestcost * slots, membercost * slots) > 30
ORDER BY cost DESC;


name	fullname	cost   	
Massage Room 2	GUEST GUEST	320.0	
Massage Room 1	GUEST GUEST	160.0	
Massage Room 1	GUEST GUEST	160.0	
Massage Room 1	GUEST GUEST	160.0	
Tennis Court 2	GUEST GUEST	150.0	
Tennis Court 1	GUEST GUEST	75.0	
Tennis Court 1	GUEST GUEST	75.0	
Tennis Court 2	GUEST GUEST	75.0	
Squash Court	GUEST GUEST	70.0	
Massage Room 1	Jemima Farrell	39.6	
Squash Court	GUEST GUEST	35.0	
Squash Court	GUEST GUEST	35.0	




/* Q9: This time, produce the same result as in Q8, but using a subquery. */

Springboard PHPMyadmin Server/country_club/Bookings/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&pos=0&db=country_club&table=Bookings

   Showing rows 0 - 11 (12 total, Query took 0.0063 seconds.)


SELECT name,fullname,cost
FROM (
        SELECT f.name, 
               CONCAT(m.firstname, ' ' ,m.surname) AS fullname,
    		   IF(m.memid = 0, f.guestcost * b.slots, f.membercost * b.slots) AS cost
    	FROM `Bookings` AS b
		INNER JOIN `Facilities` AS f USING (facid)
		INNER JOIN `Members` AS m USING (memid)
WHERE 
    b.starttime LIKE "%2012-09-14%" ) AS subquery
WHERE cost >30
ORDER BY cost DESC;


name	fullname	cost   	
Massage Room 2	GUEST GUEST	320.0	
Massage Room 1	GUEST GUEST	160.0	
Massage Room 1	GUEST GUEST	160.0	
Massage Room 1	GUEST GUEST	160.0	
Tennis Court 2	GUEST GUEST	150.0	
Tennis Court 1	GUEST GUEST	75.0	
Tennis Court 1	GUEST GUEST	75.0	
Tennis Court 2	GUEST GUEST	75.0	
Squash Court	GUEST GUEST	70.0	
Massage Room 1	Jemima Farrell	39.6	
Squash Court	GUEST GUEST	35.0	
Squash Court	GUEST GUEST	35.0	



/* PART 2: SQLite
/* We now want you to jump over to a local instance of the database on your machine. 

Copy and paste the LocalSQLConnection.py script into an empty Jupyter notebook, and run it. 

Make sure that the SQLFiles folder containing thes files is in your working directory, and
that you haven't changed the name of the .db file from 'sqlite\db\pythonsqlite'.

You should see the output from the initial query 'SELECT * FROM FACILITIES'.

Complete the remaining tasks in the Jupyter interface. If you struggle, feel free to go back
to the PHPMyAdmin interface as and when you need to. 

You'll need to paste your query into value of the 'query1' variable and run the code block again to get an output.
 
QUESTIONS:
/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

Springboard PHPMyadmin Server/country_club/Bookings/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&pos=0&db=country_club&table=Bookings

   Showing rows 0 -  5 (6 total, Query took 0.0093 seconds.)


SELECT name, SUM(cost) AS revenue
FROM
(SELECT f.name,memid,b.facid,IF(memid = 0, guestcost*slots, membercost*slots) AS cost
FROM `Bookings` AS b
LEFT JOIN `Facilities` AS f
USING (facid)) AS subquery
GROUP BY facid
HAVING SUM(cost) > 1000
ORDER BY revenue DESC;


name	revenue   	
Massage Room 1	50351.6	
Massage Room 2	14454.6	
Tennis Court 2	14310.0	
Tennis Court 1	13860.0	
Squash Court	13468.0	
Badminton Court	1906.5	


/* Q11: Produce a report of members and who recommended them in alphabetic surname,firstname order */
Springboard PHPMyadmin Server/country_club/Members/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&pos=0&db=country_club&table=Members

   Showing rows 0 - 24 (30 total, Query took 0.0004 seconds.) [surname: BADER... - SMITH...] [firstname: FLORENCE... - JACK...]


SELECT surname, firstname, recommendedby FROM `Members`
WHERE memid !=0
ORDER BY surname,firstname;


surname   	firstname   	recommendedby	
Bader	Florence	9	
Baker	Anne	9	
Baker	Timothy	13	
Boothe	Tim	3	
Butters	Gerald	1	
Coplin	Joan	16	
Crumpet	Erica	2	
Dare	Nancy	4	
Farrell	David		
Farrell	Jemima		
Genting	Matthew	5	
Hunt	John	30	
Jones	David	4	
Jones	Douglas	11	
Joplette	Janice	1	
Mackenzie	Anna	1	
Owen	Charles	1	
Pinker	David	13	
Purview	Millicent	2	
Rownam	Tim		
Rumney	Henrietta	20	
Sarwin	Ramnaresh	15	
Smith	Darren		
Smith	Darren		
Smith	Jack	1	


/* Q12: Find the facilities with their usage by member, but not guests */
Springboard PHPMyadmin Server/country_club/Members/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&pos=0&db=country_club&table=Members

   Showing rows 0 - 24 (211 total, Query took 0.1821 seconds.)


SELECT COUNT(bookid) AS booking_frequency, name, CONCAT(firstname,' ', surname) AS fullname
FROM `Members`
INNER JOIN `Bookings`
USING (memid)
INNER JOIN `Facilities`
USING (facid)
GROUP BY fullname,facid;


booking_frequency	name	fullname	
30	Badminton Court	Anna Mackenzie	
16	Table Tennis	Anna Mackenzie	
1	Massage Room 1	Anna Mackenzie	
2	Squash Court	Anna Mackenzie	
7	Snooker Table	Anna Mackenzie	
70	Pool Table	Anna Mackenzie	
6	Tennis Court 1	Anne Baker	
35	Tennis Court 2	Anne Baker	
10	Badminton Court	Anne Baker	
1	Table Tennis	Anne Baker	
3	Massage Room 1	Anne Baker	
2	Massage Room 2	Anne Baker	
49	Squash Court	Anne Baker	
12	Pool Table	Anne Baker	
31	Tennis Court 1	Burton Tracy	
3	Tennis Court 2	Burton Tracy	
2	Badminton Court	Burton Tracy	
24	Table Tennis	Burton Tracy	
31	Massage Room 1	Burton Tracy	
35	Squash Court	Burton Tracy	
20	Snooker Table	Burton Tracy	
30	Pool Table	Burton Tracy	
17	Tennis Court 1	Charles Owen	
41	Tennis Court 2	Charles Owen	
6	Badminton Court	Charles Owen	


/* Q13: Find the facilities usage by month, but not guests */

Springboard PHPMyadmin Server/country_club/Bookings/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&db=country_club&table=Bookings&pos=0

   Showing rows 0 - 24 (27 total, Query took 0.0178 seconds.)


SELECT month,COUNT(bookid) AS frequency, name
FROM(
    SELECT MONTH(starttime) AS month ,name, bookid
    FROM Bookings 
    LEFT JOIN Facilities
    USING(facid)
	WHERE memid != 0) AS subquery
GROUP BY month, name;


month	frequency	name	
7	51	Badminton Court	
7	77	Massage Room 1	
7	4	Massage Room 2	
7	103	Pool Table	
7	68	Snooker Table	
7	23	Squash Court	
7	48	Table Tennis	
7	65	Tennis Court 1	
7	41	Tennis Court 2	
8	132	Badminton Court	
8	153	Massage Room 1	
8	9	Massage Room 2	
8	272	Pool Table	
8	154	Snooker Table	
8	85	Squash Court	
8	143	Table Tennis	
8	111	Tennis Court 1	
8	109	Tennis Court 2	
9	161	Badminton Court	
9	191	Massage Room 1	
9	14	Massage Room 2	
9	408	Pool Table	
9	199	Snooker Table	
9	87	Squash Court	
9	194	Table Tennis	
