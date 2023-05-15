use QuanLySinhVien;

-- 1
select * from Subject
group by SubId
having Credit = (select max(Credit) from Subject);

-- 2

select m.SubId, m.MarkId, SubName, m.Mark 
from Subject s
join Mark m on s.SubId = m.SubId
group by MarkId
having Mark = (select max(Mark) from Mark);

-- 3
select s.StudentId, StudentName, avg(Mark) as average_mark
from Student s
left join Mark m on s.StudentId = m.StudentId
group by m.StudentId
order by Mark desc;


