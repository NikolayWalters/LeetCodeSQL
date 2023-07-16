#Table: Students#

#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| student_id    | int     |
#| student_name  | varchar |
#+---------------+---------+
#In SQL, student_id is the primary key for this table.
#Each row of this table contains the ID and the name of one student in the school.
# #

#Table: Subjects#

#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| subject_name | varchar |
#+--------------+---------+
#In SQL, subject_name is the primary key for this table.
#Each row of this table contains the name of one subject in the school.
# #

#Table: Examinations#

#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| student_id   | int     |
#| subject_name | varchar |
#+--------------+---------+
#This table may contain duplicates (In other words, there is no primary key for this table in SQL).
#Each student from the Students table takes every course from the Subjects table.
#Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
# #

#Find the number of times each student attended each exam.#

#Return the result table ordered by student_id and subject_name.#

#The result format is in the following example.#

# #

#Example 1:#

#Input: 
#Students table:
#+------------+--------------+
#| student_id | student_name |
#+------------+--------------+
#| 1          | Alice        |
#| 2          | Bob          |
#| 13         | John         |
#| 6          | Alex         |
#+------------+--------------+
#Subjects table:
#+--------------+
#| subject_name |
#+--------------+
#| Math         |
#| Physics      |
#| Programming  |
#+--------------+
#Examinations table:
#+------------+--------------+
#| student_id | subject_name |
#+------------+--------------+
#| 1          | Math         |
#| 1          | Physics      |
#| 1          | Programming  |
#| 2          | Programming  |
#| 1          | Physics      |
#| 1          | Math         |
#| 13         | Math         |
#| 13         | Programming  |
#| 13         | Physics      |
#| 2          | Math         |
#| 1          | Math         |
#+------------+--------------+
#Output: 
#+------------+--------------+--------------+----------------+
#| student_id | student_name | subject_name | attended_exams |
#+------------+--------------+--------------+----------------+
#| 1          | Alice        | Math         | 3              |
#| 1          | Alice        | Physics      | 2              |
#| 1          | Alice        | Programming  | 1              |
#| 2          | Bob          | Math         | 1              |
#| 2          | Bob          | Physics      | 0              |
#| 2          | Bob          | Programming  | 1              |
#| 6          | Alex         | Math         | 0              |
#| 6          | Alex         | Physics      | 0              |
#| 6          | Alex         | Programming  | 0              |
#| 13         | John         | Math         | 1              |
#| 13         | John         | Physics      | 1              |
#| 13         | John         | Programming  | 1              |
#+------------+--------------+--------------+----------------+
#Explanation: 
#The result table should contain all students and all subjects.
#Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
#Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
#Alex did not attend any exams.
#John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.

# Write your MySQL query statement below
SELECT s.student_id, s.student_name, sb.subject_name,
    IFNULL(COUNT(e.student_id), 0) AS attended_exams
FROM Students s
CROSS JOIN Subjects sb
LEFT JOIN Examinations e 
ON s.student_id = e.student_id
AND sb.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sb.subject_name
ORDER BY s.student_id, sb.subject_name;
