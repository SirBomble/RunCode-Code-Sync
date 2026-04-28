with total_enroll as (
    select
        course_id,
        count(student_id) as total_enrolled
    from exam_scores
    group by course_id
),
total_pass as (
    select
        course_id,
        count(student_id) as total_passed
    from exam_scores
    where score >= 60
    group by course_id
)

select 
    courses.course_name as course,
    round((total_passed * 1.0) / total_enrolled, 2) as pass_rate
from total_pass
join total_enroll on total_enroll.course_id = total_pass.course_id
join courses on courses.id = total_enroll.course_id
