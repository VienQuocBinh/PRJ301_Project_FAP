
-- insert Register student into waiting list
INSERT INTO Student(firstName, lastName, DOB, gender, address, telephone, email, specializedId, campusId)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)


-- AcaStaffDAO: get staff info
SELECT id FROM Academic
WHERE username = 'admin' AND password = 1


-- StudentDAO: get registered student (not in Academic list)
SELECT s.id, s.firstName, s.lastName, s.DOB, s.gender, s.cardNo, s.cardDate, s.cardPlace, s.address, s.telephone, s.email, s.specializedId, s.campusId, aca.studentId
FROM Student s
LEFT OUTER JOIN Academic_Student aca ON s.id = aca.studentId
WHERE aca.studentId IS NULL

-- StudentDAO: Get student by id
SELECT firstName, lastName, DOB, gender, cardNo, cardDate, cardPlace, address, telephone, email, specializedId, campusId
FROM Student 
WHERE id = 1

-- StudentDAO: get name used in FPT
SELECT firstName, lastName FROM Student
WHERE id = 3

-- StudentDAO: accept and update student
UPDATE Student
SET firstName= N'Đặng Hữu', lastName= N'Nghĩa', DOB= '1998-06-15', gender= 1, address= N'Cà Mau', telephone= '096427413', email= 'nghiacamau@aba', specializedId= 2
WHERE id =  1032

-- StudentDAO: reject and delete student
DELETE Student
WHERE id =  1029

-- CampusDAO: Get campus name
SELECT name FROM Campus
WHERE id=8

-- SpecializedDAO: get special code
SELECT code FROM Specialized
WHERE id = 1

-- Acacdemic studentDAO: insert
INSERT INTO Academic_Student (rollNumber, memberCode, enrollDate, mode, studentID)
VALUES (1, 1, '2018-08-08', 1, 1)

-- Acacdemic studentDAO: delete
DELETE Academic_Student
WHERE id = 22

-- Acacdemic studentDAO: get list student
SELECT s.id, s.firstName, s.lastName, s.DOB, s.gender, s.cardNo, s.cardDate, s.cardPlace, s.address, s.telephone, s.email, s.specializedId, s.campusId, aca.studentId
FROM Student s
LEFT OUTER JOIN Academic_Student aca ON s.id = aca.studentId
WHERE aca.studentId IS NOT NULL


-- Acacdemic studentDAO: get academic student
SELECT id, rollNumber, memberCode, enrollDate, mode FROM Academic_Student
WHERE studentId = 1040


-- ParentDAO: get parent by student ID
SELECT p.id, p.name, p.phoneNumber, p.address, p.email, p.job, p.placeWork, p.gender 
FROM Parent p
JOIN Student s ON p.id = s.parentId
WHERE s.id = 3


 
SELECT * FROM Student
SELECT * FROM Academic_Student
SELECT * FROM Academic
SELECT * FROM Campus
SELECT * FROM Campus_Academic
SELECT * FROM Specialized
SELECT * FROM Parent


ALTER TABLE PARENT
ADD gender bit NOT NULL
delete from Parent
DBCC CHECKIDENT (PARENT, RESEED, 0)

