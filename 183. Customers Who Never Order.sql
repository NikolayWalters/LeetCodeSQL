#Table: Customers#

#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| name        | varchar |
#+-------------+---------+
#In SQL, id is the primary key column for this table.
#Each row of this table indicates the ID and name of a customer.
# #

#Table: Orders#

#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| id          | int  |
#| customerId  | int  |
#+-------------+------+
#In SQL, id is the primary key column for this table.
#customerId is a foreign key (join key in Pandas) of the ID from the Customers table.
#Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
# #

#Find all customers who never order anything.#

#Return the result table in any order.#

#The result format is in the following example.#

# #

#Example 1:#

#Input: 
#Customers table:
#+----+-------+
#| id | name  |
#+----+-------+
#| 1  | Joe   |
#| 2  | Henry |
#| 3  | Sam   |
#| 4  | Max   |
#+----+-------+
#Orders table:
#+----+------------+
#| id | customerId |
#+----+------------+
#| 1  | 3          |
#| 2  | 1          |
#+----+------------+
#Output: 
#+-----------+
#| Customers |
#+-----------+
#| Henry     |
#| Max       |
#+-----------+

# Write your MySQL query statement below
# Select C.name AS Customers
# FROM Customers AS C
# WHERE C.id NOT IN (SELECT customerId FROM Orders);
SELECT c.name AS Customers
FROM Customers AS c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;