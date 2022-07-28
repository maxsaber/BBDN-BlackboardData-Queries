/* Find student internal ID */
select *
from person p
where p.stage:student_id::string = 0478869
;
/* place ID in pc.person_id below */

/* Find student enrollment by term, change term name */
select pc.id AS "Person Course ID", pc.course_id AS "Course ID", pc.available_ind, pc.enabled_ind, t.name AS "Term Name", c.name AS "Course Name"
from person_course pc
    join course c on c.id = pc.course_id
    join term t on t.id = c.term_id
where pc.person_id = 16154680
    and t.name = '2022 Spring'
;
/* place Course ID in ci.course_id below */

/* generate list of all course items */
select ci.id, ci.name, ci.item_type
from course_item ci
where ci.course_id = 20519173
ORDER BY NAME DESC
;
/* place ID in cia.course_item_id below */

/* generate a list of all item interactions for the course item */
/* this is a check to make sure that ANY student has interacted with the course item */
select cia.id, cia.course_id, c.name, cia.course_item_id, ci.name, cia.person_course_id, p.last_name, p.first_name, cia.first_accessed_time, cia.last_accessed_time
from course_item_activity cia
    inner join course c on c.id = cia.course_id
    inner join course_item ci on ci.id = cia.course_item_id
    inner join person p on p.id = cia.person_id
where cia.course_item_id = 3987596849
;

/* generate a list of student interactions for the course item */
select cia.id, cia.course_id, c.name, cia.course_item_id, ci.name, cia.person_course_id, p.last_name, p.first_name, cia.duration_sum as "Interaction Duration (seconds)", round(cia.duration_sum/60) as "Interaction Duration (minutes)", cia.interaction_cnt, cia.first_accessed_time, cia.last_accessed_time
from course_item_activity cia
    inner join course c on c.id = cia.course_id
    inner join course_item ci on ci.id = cia.course_item_id
    inner join person p on p.id = cia.person_id
where cia.course_item_id = 3987596849
    and cia.person_course_id = 840748882
;
/* if there are student interactions with the course item, proceed to see if there are any submissions */
/* place course_item_id in s.course_item_id below */

/* check to see if there are any submissions for the item by any student */
select *
from submission s
where s.course_item_id = 3987596849
;
/* if there are student submissions with the course item, proceed to see if there are any submissions for the specific student */

/* check to see if there are any submissions for the item by any student */
select *
from submission s
where s.course_item_id = 3987596849
    and s.person_course_id = 840748882
;