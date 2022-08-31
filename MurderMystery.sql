SELECT p.name as Client,i.transcript as Transcript from Interview i
JOIN Person p ON i.person_id = p.id
WHERE p.name = 'Jeremy Bowers'

