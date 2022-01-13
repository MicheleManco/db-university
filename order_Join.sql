/*
GROUP BY
1. Contare quanti iscritti ci sono stati ogni anno
2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
3. Calcolare la media dei voti di ogni appello d'esame
4. Contare quanti corsi di laurea ci sono per ogni dipartimento

JOIN
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
4. Selezionare tutti gli studenti con relativo corso di laurea e relativo dipartimento, 
    in ordine alfabetico per cognome e nome
5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
*/

-- GroupBy
1:  SELECT COUNT(id) AS Nstudenti, year(enrolment_date)
    FROM students 
        GROUP BY year(enrolment_date)

2:  SELECT COUNT(id) AS NInsegnanti , office_address 
    FROM teachers
        GROUP BY office_address  

3:  SELECT AVG(vote) AS media , exam_id 
    FROM exam_student 
        GROUP BY exam_id  

4:  SELECT COUNT(id) AS Ncorsi , department_id 
    FROM degrees 
        GROUP BY department_id 


--Join
1:  SELECT * 
    FROM students 
        JOIN degrees 
            ON students.degree_id = degrees.id 
    WHERE degrees.name = "Corso di Laurea in Economia"

2:  SELECT * 
    FROM degrees 
        JOIN departments 
            ON degrees.department_id = departments.id 
    WHERE departments.name = "Dipartimento di Neuroscienze"

3:  SELECT * 
    FROM course_teacher 
    WHERE teacher_id = 44 