
/*leetcode 175题组合两个表*/
SELECT P.FirstName, P.LastName, A.City, A.State 
FROM Person AS P
LEFT JOIN Address AS A
ON P.PersonId = A.PersonId

/*leetcode 176题第二高的薪水*/
SELECT IFNULL(
    (SELECT MAX(Salary) FROM Employee WHERE Salary != (SELECT MAX(Salary) FROM Employee)),NULL) AS SecondHighestSalary

/*leetcode 178题分数排名*/
SELECT s1.Score,COUNT(DISTINCT(s2.score)) AS 'Rank'
FROM Scores s1,Scores s2
WHERE s1.score<=s2.score
GROUP BY s1.Id
ORDER BY s1.Score DESC

/*leetcode 181题超过经理收入的员工*/
SELECT e.Name AS Employee
FROM Employee e, Employee m
WHERE e.ManagerId = m.Id AND e.Salary > m.Salary

/*leetcode 182题查找重复的电子邮箱*/
SELECT Email
FROM Person AS P
GROUP BY P.Email
HAVING COUNT(P.Email) > 1

/*leetcode 183题从不订购的客户*/
SELECT C.Name as Customers
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.Id = O.CustomerId
WHERE O.CustomerId IS NULL

/*leetcode 196题删除重复的电子邮箱*/
DELETE P1
FROM Person P1, Person P2
WHERE P1.Email = P2.Email AND P1.Id > P2.Id

/*leetcode 197题上升的温度*/
SELECT B.Id
FROM Weather AS A, Weather AS B
WHERE A.Temperature < B.Temperature AND
(SELECT TIMESTAMPDIFF(DAY,A.RecordDate, B.RecordDate))=1

/*leetcode 511题游戏玩法分析1*/
SELECT player_id, min(event_date) AS first_login
FROM Activity
GROUP BY player_id

/*leetcode 619题只出现一次的最大数字*/
SELECT MAX(num) AS num
FROM (SELECT num, COUNT(num) AS summary FROM my_numbers GROUP BY num) AS new_table
WHERE summary=1
                      
/*leetcode 180题连续出现的数字*/
SELECT DISTINCT L1.Num AS ConsecutiveNums
FROM Logs AS L1, Logs AS L2, Logs AS L3
WHERE L1.Id-L2.Id=1 AND L2.Id-L3.Id=1 AND L1.Num=L2.Num AND L2.Num=L3.Num
                      
/*leetcode 184题部门工资最高的员工*/
SELECT D.Name AS Department, N3.Name AS Employee, N3.Salary AS Salary
FROM(SELECT N2.DepartmentId AS Department, N2.Name AS Name, N2.Salary AS Salary
FROM (SELECT E1.DepartmentId, E1.Name, MAX(E1.Salary) AS Salary
FROM Employee AS E1
GROUP BY E1.DepartmentId) AS N1, Employee AS N2
WHERE N2.Salary = N1.Salary AND N2.DepartmentId = N1.DepartmentId) AS N3, Department AS D
WHERE N3.Department = D.Id
                      
/*leetcode 512题游戏玩法分析2*/
SELECT A.player_id, A.device_id
FROM(SELECT player_id, device_id, MIN(event_date) AS event_date
FROM Activity
GROUP BY player_id) AS N, Activity AS A
WHERE A.event_date = N.event_date AND A.player_id = N.player_id
                      
/*letcode 577题员工奖金*/
SELECT name, bonus
FROM (SELECT E.empId, E.name, B.bonus
FROM Employee AS E
LEFT JOIN Bonus AS B
ON E.empId = B.empId) AS new_table
WHERE bonus < 1000 OR bonus IS NULL

/*leetcode 584题寻找用户推荐人*/                      
SELECT name
FROM customer
WHERE referee_id !=2 OR referee_id IS NULL  
                      
/*leetcode 586题订单最多的客户*/
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1
                                          
