
/*
1. Profile the data by finding the total number of records for each of the tables below:
i. Attribute table = 10000
ii. Business table = 10000 
iii. Category table = 10000
iv. Checkin table = 10000 
v. elite_years table = 10000 
vi. friend table = 10000 
vii. hours table = 10000 
viii. photo table = 10000 
ix. review table = 10000 
x. tip table = 10000 
xi. user table = 10000 



2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business =10000 
ii. Hours = 1562 
iii. Category = 2643 
iv. Attribute = 1115 
v. Review:
id= 10000 
business_id = 8090 
user_id = 9581 

vi. Checkin = 493 
vii. Photo:
id=10000 
business_id = 6493 

viii. Tip:
business_id = 3979 
user_id = 537

ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780 



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: NO
	
	
	SQL code used to arrive at answer:
*/
SELECT *
FROM user
WHERE id IS NULL 
OR  name IS NULL
OR  review_count IS NULL
OR  yelping_since IS NULL
OR  useful IS NULL
OR  funny IS NULL
OR  cool IS NULL
OR  fans IS NULL
OR  average_stars IS NULL
OR  compliment_hot IS NULL
OR  compliment_more IS NULL
OR  compliment_profile IS NULL
OR  compliment_cute IS NULL
OR  compliment_list IS NULL
OR  compliment_note IS NULL
OR  compliment_plain IS NULL
OR  compliment_cool IS NULL
OR  compliment_funny IS NULL
OR  compliment_writer IS NULL
OR  compliment_photos IS NULL
/*
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:1		max:5		avg:3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:1.0		max:5.0 		avg:3.6549 
		
	
	iii. Table: Tip, Column: Likes
	
		min:0		max:2		avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:1		max:53		avg:1.9414 
		
	
	v. Table: User, Column: Review_count
	
		min:0		max:2000		avg:24.2995



5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
*/
SELECT city, SUM(review_count) AS review_count_sum
FROM business
GROUP BY city
ORDER BY review_count_sum DESC


/*	
	
	Copy and Paste the Result Below:
	
		city            | review_count_sum |
	+-----------------+------------------+
	| Las Vegas       |            82854 |
	| Phoenix         |            34503 |
	| Toronto         |            24113 |
	| Scottsdale      |            20614 |
	| Charlotte       |            12523 |
	| Henderson       |            10871 |
	| Tempe           |            10504 |
	| Pittsburgh      |             9798 |
	| Montréal        |             9448 |
	| Chandler        |             8112 |
	| Mesa            |             6875 |
	| Gilbert         |             6380 |
	| Cleveland       |             5593 |
	| Madison         |             5265 |
	| Glendale        |             4406 |
	| Mississauga     |             3814 |
	| Edinburgh       |             2792 |
	| Peoria          |             2624 |
	| North Las Vegas |             2438 |
	| Markham         |             2352 |
	| Champaign       |             2029 |
	| Stuttgart       |             1849 |
	| Surprise        |             1520 |
	| Lakewood        |             1465 |
	| Goodyear        |             1155 |
	+-----------------+------------------+
	(Output limit exceeded, 25 of 362 total rows shown)
	
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:
*/
SELECT stars,  count(stars) AS count
FROM business
WHERE city = 'Avon'
GROUP BY stars
/*
	Copy and Paste the Resulting Table Below (2 columns – star rating and count):

	+-------+-------+
	| stars | count |
	+-------+-------+
	|   1.5 |     1 |
	|   2.5 |     2 |
	|   3.5 |     3 |
	|   4.0 |     2 |
	|   4.5 |     1 |
	|   5.0 |     1 |
	+-------+-------+

ii. Beachwood

SQL code used to arrive at answer:
*/
SELECT stars,  count(stars) AS count
FROM business
WHERE city = 'Beachwood'
GROUP BY stars
/*

	Copy and Paste the Resulting Table Below (2 columns – star rating and count):

	+-------+-------+
	| stars | count |
	+-------+-------+
	|   2.0 |     1 |
	|   2.5 |     1 |
	|   3.0 |     2 |
	|   3.5 |     2 |
	|   4.0 |     1 |
	|   4.5 |     2 |
	|   5.0 |     5 |
	+-------+-------+	
	

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
*/

SELECT id, name, review_count
FROM user
ORDER BY review_count DESC
LIMIT 3

/*		
	Copy and Paste the Result Below:
	
	+------------------------+--------+--------------+
	| id                     | name   | review_count |
	+------------------------+--------+--------------+
	| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
	| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
	| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
	+------------------------+--------+--------------+
	
8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	
	As we cannot calculate the correlation coefficient in SQLite enviroment provided in this course, the analysis was performed using the expert method. 
	If we look at the table below, we can see that there is no significant correlation between posing reviews and number of fans. 
	For example, Gerald with the most reviews has fewer fans than Harald or Mimi who have published fewer reviews. 
	Sara and Yuri, who are the second and third reviewers, have fewer fans than Lisa, who is at the bottom of the ranking(considering only the first 25 results with the most reviews).
	In summary, the reviewers with the most reviews are not necessarily the most popular in terms of number of fans,so based on the first 25 results, I conclude that the correlation is low.
	However, as I mentioned at the beginning, we cannot perform a proper correlation analysis due to the limitations of the tools provided in the course.
	
SELECT  name, id, review_count, fans
FROM user
ORDER BY review_count DESC;
	
	+-----------+------------------------+--------------+------+
	| name      | id                     | review_count | fans |
	+-----------+------------------------+--------------+------+
	| Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |         2000 |  253 |
	| Sara      | -3s52C4zL_DHRK0ULG6qtg |         1629 |   50 |
	| Yuri      | -8lbUNlXVSoXqaRRiHiSNg |         1339 |   76 |
	| .Hon      | -K2Tcgh2EKX6e6HqqIrBIQ |         1246 |  101 |
	| William   | -FZBTkAZEXoP7CYvRV2ZwQ |         1215 |  126 |
	| Harald    | --2vR0DIsmQ6WfcSzKWigw |         1153 |  311 |
	| eric      | -gokwePdbXjfS0iF7NsUGA |         1116 |   16 |
	| Roanna    | -DFCC64NXgqrxlO8aLU5rg |         1039 |  104 |
	| Mimi      | -8EnCioUmDygAbsYZmTeRQ |          968 |  497 |
	| Christine | -0IiMAZI2SsQ7VmyzJjokQ |          930 |  173 |
	| Ed        | -fUARDNuXAfrOn4WLSZLgA |          904 |   38 |
	| Nicole    | -hKniZN2OdshWLHYuj21jQ |          864 |   43 |
	| Fran      | -9da1xk7zgnnfO1uTVYGkA |          862 |  124 |
	| Mark      | -B-QEUESGWHPE_889WJaeg |          861 |  115 |
	| Christina | -kLVfaJytOJY2-QdQoCcNQ |          842 |   85 |
	| Dominic   | -kO6984fXByyZm3_6z2JYg |          836 |   37 |
	| Lissa     | -lh59ko3dxChBSZ9U7LfUw |          834 |  120 |
	| Lisa      | -g3XIcCb2b-BD0QBCcq2Sw |          813 |  159 |
	| Alison    | -l9giG8TSDBG1jnUBUXp5w |          775 |   61 |
	| Sui       | -dw8f7FLaUmWR7bfJ_Yf0w |          754 |   78 |
	| Tim       | -AaBjWJYiQxXkCMDlXfPGw |          702 |   35 |
	| L         | -jt1ACMiZljnBFvS6RRvnA |          696 |   10 |
	| Angela    | -IgKkE8JvYNWeGu8ze4P8Q |          694 |  101 |
	| Crissy    | -hxUwfo3cMnLTv-CAaP69A |          676 |   25 |
	| Lyn       | -H6cTbVxeIRYR-atxdielQ |          675 |   45 |
	+-----------+------------------------+--------------+------+
	(Output limit exceeded, 25 of 10000 total rows shown)
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: There are more reviews with the word "love"
			+-------------+--------------+
			| count(text) | Hate_or_Love |
			+-------------+--------------+
			|        1726 | love         |
			|         232 | hate         |
			+-------------+--------------+	
			

	
	SQL code used to arrive at answer:
*/
SELECT count(text), 
CASE
WHEN  text LIKE '%hate%' THEN 'hate'
WHEN  text LIKE '%love%' THEN 'love'
ELSE 'other'
END Hate_or_Love
FROM review
GROUP BY Hate_or_Love
HAVING Hate_or_Love IN ('love', 'hate')
ORDER BY Hate_or_Love DESC

/*
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
*/
SELECT id, name, fans
FROM user
ORDER BY fans DESC
LIMIT 10

/*
	
	Copy and Paste the Result Below:
	
	+------------------------+-----------+------+
	| id                     | name      | fans |
	+------------------------+-----------+------+
	| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
	| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
	| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
	| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
	| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
	| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
	| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
	| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
	| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
	| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
	+------------------------+-----------+------+



Part 2: Inferences and Analysis
1. Pick one city and category of your choice and group the businesses 
in that city or category by their overall star rating. Compare the businesses 
with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
There is a difference, restaurants in the group with 2-3 stars open earlier and most of them are open longer than restaurants with 3-4 stars

	+--------+-------------+-------------+
	| groups | new_hours   | count_hours |
	+--------+-------------+-------------+
	| 2-3    | 10:00-23:00 |           1 |
	| 2-3    | 10:00-4:00  |           1 |
	| 2-3    | 10:30-21:00 |           6 |
	| 2-3    | 11:00-19:00 |           1 |
	| 2-3    | 11:00-23:00 |           7 |
	| 2-3    | 9:00-23:00  |           4 |
	| 2-3    | 9:00-4:00   |           1 |
	| 4-5    | 11:00-23:00 |           6 |
	| 4-5    | 12:00-16:00 |           1 |
	| 4-5    | 14:00-23:00 |           1 |
	| 4-5    | 16:00-2:00  |           3 |
	| 4-5    | 18:00-23:00 |           4 |
	| 4-5    | 18:00-2:00  |           4 |
	+--------+-------------+-------------+
*/
SELECT

CASE
WHEN stars BETWEEN 2 AND 3 THEN '2-3'
WHEN stars BETWEEN 4 AND 5 THEN '4-5'
ELSE 'other'
END groups,

CASE
WHEN hours LIKE 'Monday%' THEN SUBSTR(hours,8)
WHEN hours LIKE 'Tuesday%' THEN SUBSTR(hours,9)
WHEN hours LIKE 'Wednesday%' THEN SUBSTR(hours,11)
WHEN hours LIKE 'Thursday%' THEN SUBSTR(hours,10)
WHEN hours LIKE 'Saturday%' THEN SUBSTR(hours,10)
WHEN hours LIKE 'Sunday%' THEN SUBSTR(hours,8)
WHEN hours LIKE 'Friday%' THEN SUBSTR(hours,8)
END new_hours, count(*) AS count_hours

FROM business AS b
LEFT JOIN category AS c ON b.id=c.business_id
LEFT JOIN hours AS h ON h.business_id=b.id
WHERE groups IN('2-3', '4-5') AND city = 'Toronto' AND category = 'Restaurants' AND NOT hours= 'None'
GROUP BY groups, new_hours


/*

ii. Do the two groups you chose to analyze have a different number of reviews?

Restaurants in group 4-5 have more reviews on average

+---------+-------------+-------------------+--------+
| city    | category    | AVG(review_count) | groups |
+---------+-------------+-------------------+--------+
| Toronto | Restaurants |     28.6666666667 | 2-3    |
| Toronto | Restaurants |              41.2 | 4-5    |
+---------+-------------+-------------------+--------+

*/

SELECT city, category, AVG(review_count), 
CASE
WHEN stars BETWEEN 2 AND 3 THEN '2-3'
WHEN stars BETWEEN 4 AND 5 THEN '4-5'
ELSE 'other'
END groups
FROM business AS b
LEFT JOIN category AS c ON b.id=c.business_id
WHERE groups IN('2-3', '4-5') AND city = 'Toronto' AND category = 'Restaurants'
GROUP BY groups
/*
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
Businesses located in the same neighborhood have similar ratings. They also have similar hours of operation.
Restaurants in neighborhoods Downtown Core and Entertainment District opens in the morning and restaurants in neighborhoods High Park and Niagara opens afternoon.

+------------------------+--------+-------------+-------------+
| neighborhood           | groups | new_hours   | count_hours |
+------------------------+--------+-------------+-------------+
| Downtown Core          | 2-3    | 10:30-21:00 |           6 |
| Downtown Core          | 2-3    | 11:00-19:00 |           1 |
| Downtown Core          | 2-3    | 11:00-23:00 |           7 |
| Entertainment District | 2-3    | 10:00-23:00 |           1 |
| Entertainment District | 2-3    | 10:00-4:00  |           1 |
| Entertainment District | 2-3    | 9:00-23:00  |           4 |
| Entertainment District | 2-3    | 9:00-4:00   |           1 |
| Etobicoke              | 4-5    | 11:00-23:00 |           6 |
| Etobicoke              | 4-5    | 14:00-23:00 |           1 |
| High Park              | 4-5    | 16:00-2:00  |           3 |
| High Park              | 4-5    | 18:00-2:00  |           4 |
| Niagara                | 4-5    | 12:00-16:00 |           1 |
| Niagara                | 4-5    | 18:00-23:00 |           4 |
+------------------------+--------+-------------+-------------+

*/
SELECT neighborhood,

CASE
WHEN stars BETWEEN 2 AND 3 THEN '2-3'
WHEN stars BETWEEN 4 AND 5 THEN '4-5'
ELSE 'other'
END groups,

CASE
WHEN hours LIKE 'Monday%' THEN SUBSTR(hours,8)
WHEN hours LIKE 'Tuesday%' THEN SUBSTR(hours,9)
WHEN hours LIKE 'Wednesday%' THEN SUBSTR(hours,11)
WHEN hours LIKE 'Thursday%' THEN SUBSTR(hours,10)
WHEN hours LIKE 'Saturday%' THEN SUBSTR(hours,10)
WHEN hours LIKE 'Sunday%' THEN SUBSTR(hours,8)
WHEN hours LIKE 'Friday%' THEN SUBSTR(hours,8)
END new_hours, count(*) AS count_hours

FROM business AS b
LEFT JOIN category AS c ON b.id=c.business_id
LEFT JOIN hours AS h ON h.business_id=b.id
WHERE groups IN('2-3', '4-5') AND city = 'Toronto' AND category = 'Restaurants' AND NOT hours= 'None'
GROUP BY groups, neighborhood, new_hours
/*		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.

+---------+----------------+-------------------+---------------+
| is_open | count(is_open) | AVG(review_count) |  AVG(b.stars) |
+---------+----------------+-------------------+---------------+
|       0 |             71 |     129.816901408 | 3.54225352113 |
|       1 |            565 |     311.187610619 |  3.7610619469 |
+---------+----------------+-------------------+---------------+


i. Difference 1: Open businesses have more reviews on average
         
         
ii. Difference 2: Open businesses have a slightly better star rating than closed ones
     

+---------+----------------+------------+
| is_open | count(is_open) | AVG_visits |
+---------+----------------+------------+
|       0 |             12 |       1.25 |
|       1 |            498 |       1.65 |
+---------+----------------+------------+     

 
iii. Difference 3:	Open businesses have more visits on average
	 
		 
         
SQL code used for analysis:
*/
SELECT is_open, count(is_open),AVG(review_count), AVG(b.stars)
FROM business AS b
INNER JOIN review AS r ON b.id = r.business_id
GROUP BY b.is_open


SELECT is_open, count(is_open),ROUND(AVG(c.count),2) AS AVG_visits
FROM business AS b
INNER JOIN checkin AS c ON c.business_id=b.id
GROUP BY b.is_open
		 
/*
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

Parsing out keywords from reviews to determine rating awarded by reviewers
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

For my analysis I need columns stars and text from table Review. I need to create 2 new columns, the first containing 
keywords in review based on "text" column and second one with number of reviews containing particular keyword and stars awarded 
I decided to analyze this data because I want to confirm the hypothesis that keywords in a review correlate with the stars given to businesses                         
                  
iii. Output of your finished dataset:

As you can see below, there is a correlation between keywords in a review and stars.
Reviews with negative words such as "terrible" or "bad" tend to have a worse star rating for businesses.
In contrast, reviews containing positive keywords such as "fantastic", "good," "love" awarding better ratings
+-------+-----------+-------------------+
| stars | Keywords  | Number_of_reviews |
+-------+-----------+-------------------+
|     1 | Bad       |               137 |
|     2 | Bad       |                58 |
|     3 | Bad       |                47 |
|     4 | Bad       |                53 |
|     5 | Bad       |                49 |
|     1 | Fantastic |                 5 |
|     2 | Fantastic |                 1 |
|     3 | Fantastic |                12 |
|     4 | Fantastic |                38 |
|     5 | Fantastic |               124 |
|     1 | Good      |               291 |
|     2 | Good      |               295 |
|     3 | Good      |               516 |
|     4 | Good      |               878 |
|     5 | Good      |               856 |
|     1 | Horrible  |                82 |
|     2 | Horrible  |                12 |
|     3 | Horrible  |                10 |
|     4 | Horrible  |                 5 |
|     5 | Horrible  |                 3 |
|     1 | Love      |                85 |
|     2 | Love      |                65 |
|     3 | Love      |               159 |
|     4 | Love      |               489 |
|     5 | Love      |               982 |
+-------+-----------+-------------------+
         
         
iv. Provide the SQL code you used to create your final dataset:
*/
SELECT stars,
CASE
WHEN text LIKE '%love%' Then 'Love'
WHEN text LIKE '%good%' THEN 'Good'
WHEN text LIKE '%bad%' THEN 'Bad'
WHEN text LIKE '%horrible%' THEN 'Horrible'
WHEN text LIKE '%fantastic%' THEN 'Fantastic'
ELSE 'other'
END Keywords, count(*) AS Number_of_reviews
FROM review
WHERE Keywords IS NOT 'other'
GROUP BY  Keywords, stars

