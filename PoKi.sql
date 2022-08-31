---What grades are stored in the database?
--SELECT *
--FROM Grade

---What emotions may be associated with a poem?
--SELECT Name
--FROM Emotion


---How many poems are in the database?
--SELECT COUNT(*) as 'Poem Count'
--FROM Poem

---Sort authors alphabetically by name. What are the names of the top 76 authors?
--SELECT TOP 76 [Name]
--FROM Author
--ORDER BY Name

---Starting with the above query, add the grade of each of the authors.
--SELECT TOP 76 auth.Name,gr.Name FROM Author auth
--LEFT JOIN Grade gr ON auth.GradeId = gr.Id
--ORDER BY auth.Name


---Starting with the above query, add the recorded gender of each of the authors.
--SELECT TOP 76 auth.Name,gr.Name,gen.Name FROM Author auth
--LEFT JOIN Grade gr ON auth.GradeId = gr.Id
--LEFT JOIN Gender gen ON auth.GenderId = gen.Id
--ORDER BY auth.Name

---What is the total number of words in all poems in the database?
--SELECT SUM(WordCount)
--FROM Poem

---Which poem has the fewest characters?
--SELECT TOP 1 Title
--FROM Poem
--ORDER BY CharCount

---How many authors are in the third grade?
--SELECT COUNT(*)
--FROM Author A
--JOIN Grade G ON G.Id = A.GradeId
--WHERE G.Name = '3rd Grade'

---How many total authors are in the first through third grades?
--SELECT COUNT(*)
--FROM Author A
--JOIN Grade G ON G.Id = A.GradeId
--WHERE G.Name = '1st Grade' 
--OR G.Name = '2nd Grade' 
--OR G.Name = '3rd Grade' 


---What is the total number of poems written by fourth graders?
--SELECT COUNT(*)
--FROM Poem P
--JOIN Author A ON A.Id = P.AuthorId
--JOIN Grade G ON G.Id = A.GradeId
--WHERE G.Name = '4th Grade'


---How many poems are there per grade?
--SELECT gr.Name AS Grade, COUNT(p.Id) AS Poems
--FROM Poem p
--LEFT JOIN Author a ON p.AuthorId = a.Id
--LEFT JOIN Grade gr ON a.GradeId = gr.Id
--GROUP BY gr.Name;


---How many authors are in each grade? (Order your results by grade starting with 1st Grade)
--SELECT gr.Name AS Grade, COUNT(a.Id) AS Authors
--FROM Author a
--LEFT JOIN Grade gr ON a.GradeId = gr.Id
--GROUP BY gr.Name;

---What is the title of the poem that has the most words?
--SELECT TOP 1 Title, WordCount
--FROM Poem p
--ORDER BY p.WordCount DESC

---Which author(s) have the most poems? (Remember authors can have the same name.)
--SELECT a.Id, a.Name, COUNT(p.Id) AS NumPoems
--FROM Poem p
--LEFT JOIN Author a ON p.AuthorId = a.Id
--GROUP BY a.Id, a.Name
--ORDER BY NumPoems DESC;


---How many poems have an emotion of sadness?
--SELECT COUNT(pe.Id)
--FROM PoemEmotion pe
--LEFT JOIN Emotion e ON pe.EmotionId = e.Id
--WHERE e.Name = 'Sadness';


---How many poems are not associated with any emotion?
--SELECT COUNT(p.Id) as EmotionlessPoemCount
--FROM Poem p
--LEFT JOIN PoemEmotion pe ON p.Id = pe.PoemId
--WHERE pe.Id IS NULL



---Which emotion is associated with the least number of poems?
--SELECT TOP 1 e.Name, COUNT(pe.Id) as Poems
--FROM Emotion e
--LEFT JOIN PoemEmotion pe ON pe.EmotionId = e.Id
--GROUP BY e.Name
--ORDER BY Poems


---Which grade has the largest number of poems with an emotion of joy?
--SELECT gr.Name, COUNT(pe.Id) AS JoyfulPoems
--FROM PoemEmotion pe
--LEFT JOIN Emotion e ON pe.EmotionId = e.Id
--LEFT JOIN Poem p ON pe.PoemId = p.Id
--LEFT JOIN Author a ON p.AuthorId = a.Id
--LEFT JOIN Grade gr ON a.GradeId = gr.Id
--WHERE e.Name = 'Joy'
--GROUP BY gr.Name
--ORDER BY COUNT(pe.Id) DESC;


---Which gender has the least number of poems with an emotion of fear?
--SELECT ge.Name, COUNT(pe.Id) AS ScaryPoems
--FROM PoemEmotion pe
--LEFT JOIN Emotion e ON pe.EmotionId = e.Id
--LEFT JOIN Poem p ON pe.PoemId = p.Id
--LEFT JOIN Author a ON p.AuthorId = a.Id
--LEFT JOIN Gender ge ON a.GenderId = ge.Id
--WHERE e.Name = 'Fear'
--GROUP BY ge.Name
--ORDER BY COUNT(pe.Id);
