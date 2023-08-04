#Table: Logs#

#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| num         | varchar |
#+-------------+---------+
#In SQL, id is the primary key for this table.
#id is an autoincrement column.
# #

#Find all numbers that appear at least three times consecutively.#

#Return the result table in any order.#

#The result format is in the following example.#

# #

#Example 1:#

#Input: 
#Logs table:
#+----+-----+
#| id | num |
#+----+-----+
#| 1  | 1   |
#| 2  | 1   |
#| 3  | 1   |
#| 4  | 2   |
#| 5  | 1   |
#| 6  | 2   |
#| 7  | 2   |
#+----+-----+
#Output: 
#+-----------------+
#| ConsecutiveNums |
#+-----------------+
#| 1               |
#+-----------------+
#Explanation: 1 is the only number that appears consecutively for at least three times.

SELECT DISTINCT num as ConsecutiveNums
FROM (
  SELECT num,
  LAG(num, 1) OVER (ORDER BY id) as prev_value1,
  LAG(num, 2) OVER (ORDER BY id) as prev_value2
  FROM Logs
) as T
WHERE num = prev_value1 AND num = prev_value2;
