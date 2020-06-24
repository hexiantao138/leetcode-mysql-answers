
/*leetcode 175�����������*/
SELECT P.FirstName, P.LastName, A.City, A.State 
FROM Person AS P
LEFT JOIN Address AS A
ON P.PersonId = A.PersonId

/*leetcode 176��ڶ��ߵ�нˮ*/
SELECT IFNULL(
    (SELECT MAX(Salary) FROM Employee WHERE Salary != (SELECT MAX(Salary) FROM Employee)),NULL) AS SecondHighestSalary

/*leetcode 178���������*/
SELECT s1.Score,COUNT(DISTINCT(s2.score)) AS 'Rank'
FROM Scores s1,Scores s2
WHERE s1.score<=s2.score
GROUP BY s1.Id
ORDER BY s1.Score DESC

/*leetcode 181�ⳬ�����������Ա��*/
SELECT e.Name AS Employee
FROM Employee e, Employee m
WHERE e.ManagerId = m.Id AND e.Salary > m.Salary

/*leetcode 182������ظ��ĵ�������*/
SELECT Email
FROM Person AS P
GROUP BY P.Email
HAVING COUNT(P.Email) > 1

/*leetcode 183��Ӳ������Ŀͻ�*/
SELECT C.Name as Customers
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.Id = O.CustomerId
WHERE O.CustomerId IS NULL

/*leetcode 196��ɾ���ظ��ĵ�������*/
DELETE P1
FROM Person P1, Person P2
WHERE P1.Email = P2.Email AND P1.Id > P2.Id

/*leetcode 197���������¶�*/
SELECT B.Id
FROM Weather AS A, Weather AS B
WHERE A.Temperature < B.Temperature AND
(SELECT TIMESTAMPDIFF(DAY,A.RecordDate, B.RecordDate))=1

/*leetcode 511����Ϸ�淨����1*/
SELECT player_id, min(event_date) AS first_login
FROM Activity
GROUP BY player_id

/*leetcode 619��ֻ����һ�ε��������*/
SELECT MAX(num) AS num
FROM (SELECT num, COUNT(num) AS summary FROM my_numbers GROUP BY num) AS new_table
WHERE summary=1