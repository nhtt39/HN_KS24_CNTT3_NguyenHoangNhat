create database bai_kiem_tra;
use bai_kiem_tra;

create table students (
	student_id int primary key auto_increment,
    student_name varchar(100) not null,
    email varchar(100) unique,
    phone_number char(10) unique
);

create table course (
	course_id int primary key auto_increment,
    course_name varchar(100) not null,
    credits int check(credits>0)
);

create table enrollment (
	student_id int,
    course_id int,
    grade decimal(4,2) default 0,
    foreign key (student_id) references students (student_id),
    foreign key (course_id) references course (course_id)
);

insert into students (student_name,email,phone_number) 
values ('nguyễn hoàng nhật','nhat@gmail.com','0349910997'),
		('nguyễn minh duy','duy@gmail.com','0123456789'),
		('trịnh khắc hưng','hung@gmail.com','0234567891'),
		('lê thành long','long@gmail.com','0345678912'),
		('hà quang huy','huy@gmail.com','0456789123'),
		('hoang thiên sơn','son@gmail.com','0567891234');
        
insert into course (course_name,credits) 
values ('c++','3'),
		('frontend','6'),
		('backend','5'),
		('java','4'),
		('csdl','2');
        
insert into enrollment (course_id,student_id,grade) 
values ('1','1','9'),
		('2','2','8'),
        ('3','3','7'),
        ('4','4','8'),
        ('5','5','9');
        
update enrollment
set grade = '9.0'
where student_id = 2 and course_id = 3;

select student_name,email,phone_number from students;

delete from course
where course_id = 101

-- nếu không xóa được thì theo em là do hệ thống đang tham chiếu thông qua khóa ngoại của bảng enrollment nên không thể xóa để tránh lỗi dữ liệu
