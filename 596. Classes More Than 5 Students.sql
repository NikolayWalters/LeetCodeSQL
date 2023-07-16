#Table: Courses#

#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| student     | varchar |
#| class       | varchar |
#+-------------+---------+
#In SQL, (student, class) is the primary key column for this table.
#Each row of this table indicates the name of a student and the class in which they are enrolled.
# #

#Find all the classes that have at least five students.#

#Return the result table in any order.#

#The result format is in the following example.#

# #

#Example 1:#

#Input: 
#Courses table:
#+---------+----------+
#| student | class    |
#+---------+----------+
#| A       | Math     |
#| B       | English  |
#| C       | Math     |
#| D       | Biology  |
#| E       | Math     |
#| F       | Computer |
#| G       | Math     |
#| H       | Math     |
#| I       | Math     |
#+---------+----------+
#Output: 
#+---------+
#| class   |
#+---------+
#| Math    |
#+---------+
#Explanation: 
#- Math has 6 students, so we include it.
#- English has 1 student, so we do not include it.
#- Biology has 1 student, so we do not include it.
#- Computer has 1 student, so we do not include it.

# Write your MySQL query statement below
SELECT class FROM Courses
GROUP BY class HAVING COUNT(*) >= 5;