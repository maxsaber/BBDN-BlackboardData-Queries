select
    lc.name as course,
    lc.course_number,
    round(sum(ca.duration)/60,0) as total_minutes
from cdm_clb.attendance ca
inner join cdm_clb.session cs
    on cs.id = ca.session_id
inner join cdm_map.course_room mcr
    on mcr.clb_room_id = cs.room_id
inner join cdm_lms.course lc
    on lc.id = mcr.lms_course_id
where ca.first_join_time >= dateadd(day,-7,current_date())
group by course_number
order by total_minutes desc
limit 10