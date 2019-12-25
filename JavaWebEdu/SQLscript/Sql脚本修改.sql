create table school(
	id bigint auto_increment,
	no varchar(10) not null unique,
	description varchar(255) not null unique,
	primary key(id)
);
insert into school(no,description) values('01','宇宙大学');

create table college(
	id bigint auto_increment,
	no varchar(10) not null unique,
	description varchar(255) not null unique,
	school_id bigint,
	foreign key(school_id) references school(id),
	primary key(id)
);
insert into college(no,description,school_id) values('0101','管理工程学院',1);
insert into college(no,description,school_id) values('0102','土木工程学院',1);
insert into college(no,description,school_id) values('0103','核工程学院',1);

create table degree(
	id bigint auto_increment,
	no varchar(10) not null unique,
	description varchar(255) not null unique,
	primary key(id)
);
insert into degree(no,description) values('01','学士');
insert into degree(no,description) values('02','硕士');
insert into degree(no,description) values('03','博士');


create table term(
	id bigint auto_increment,
	no varchar(10) not null unique,
	description varchar(255) not null unique,
	primary key(id)
);

insert into term(no,description) values('01','2018-2019第一学期');
insert into term(no,description) values('02','2018-2019第二学期');
insert into term(no,description) values('03','2019-2020第一学期');

create table title(
	id bigint auto_increment,
	no varchar(10) not null unique,
	description varchar(255) not null unique,
	primary key(id)
);

insert into title(no,description) values('01','教授');
insert into title(no,description) values('02','讲师');
insert into title(no,description) values('03','副教授');

create table periods(
	id bigint auto_increment,
	no varchar(10) not null unique,
	startPoint smallint not null,
	endPoint smallint not null,
		constraint testStart check(startPoint>0 and startPoint<=12 and endPoint>startPoint),
	primary key(id)
);

insert into periods(no,startPoint,endPoint) values('01',1,2);
insert into periods(no,startPoint,endPoint) values('02',1,3);

create table coursetype(
	id bigint auto_increment,
	no varchar(10) not null unique,
	description varchar(255) not null unique,
	remarks varchar(255),
	primary key(id)
);

insert into coursetype(no,description,remarks) values('01','公共必修课','无');
insert into coursetype(no,description,remarks) values('02','学科基础必修课','无');
insert into coursetype(no,description,remarks) values('03','专业基础必修课','无');

create table appealstatus(
	id bigint auto_increment,
	no varchar(10) not null unique,
	description varchar(255) not null unique,
		constraint testStatus check(description in ('审核中','未通过','')),
	primary key(id)
);

insert into appealstatus(no,description) values('01','审核中');
insert into appealstatus(no,description) values('02','未通过');
insert into appealstatus(no,description) values('03','通过');

create table department(
 	id bigint not null auto_increment,
 	no varchar(255) not null unique,
 	name  varchar(255) not null,
	college_id bigint not null,
 	foreign key(college_id) references college(id),
	primary key(id)
);

insert into department(no,name,college_id) values ('01','信息管理与信息系统',1);
insert into department(no,name,college_id) values ('02','房地产开发与管理',1);
insert into department(no,name,college_id) values ('03','土地资源管理',1);


create table actor(
	id bigint auto_increment,
	name varchar(10) not null,
	IDCard varchar(255) not null unique,
	phoneNumber varchar(255),
	constraint testIDCard check(length(IDCard)=18),
	primary key(id)
);
insert into actor(studentNo,name,IDCard,phoneNumber) values('201801100','许光达','371525200112233700','911');



create table student(
	id bigint,
	studentNo varchar(255) not null unique,
	department_id bigint,
	foreign key(department_id) references department(id),
	foreign key(id) references actor(id),
	primary key(id)
);

-- insert into student(studentNo,name,IDCard,phoneNumber) values('201801100','许光达','371525200112233700','911');
-- insert into student(studentNo,name,IDCard,phoneNumber) values('201801101','张宗逊','371525200112233701','911');
-- insert into student(studentNo,name,IDCard,phoneNumber) values('201801102','赵尚志','371525200112233702','911');


create table teacher(
	id bigint,
	TeacherNo varchar(255) not null unique,
	primary key(id),
	degree_id bigint not null,
	department_id bigint not null,
	title_id bigint not null,
	foreign key(degree_id) references degree(id),
	foreign key(department_id) references department(id),
	foreign key(title_id) references title(id),
	foreign key(id) references actor(id)
);


create table administrator(
	id bigint,
	AdministratorNo varchar(255) not null unique,
	college_id bigint not null,
    foreign key(college_id) references college(id),
	foreign key(id) references actor(id),
	primary key(id)
);


create table user(
	id bigint auto_increment,
	username varchar(255) not null unique,
	password varchar(255) not null,
	actor_id bigint not null unique,
	foreign key(actor_id) references actor(id),
	primary key(id)
);

create table role
(
    id          bigint auto_increment
        primary key,
    no          varchar(255) not null,
    description varchar(255) not null,
    constraint Role_no_uindex
        unique (no)
);



create table menu
(
    id          bigint auto_increment
        primary key,
    description varchar(255) not null,
    no          varchar(255) not null,
    url         varchar(255) not null,
    constraint menu_no_uindex
        unique (no)
);


create table rolemenuass
(
    id      bigint auto_increment
        primary key,
    role_id bigint null,
    menu_id bigint null,
    constraint role_id
        unique (role_id, menu_id),
    constraint rolemenuass_ibfk_1
        foreign key (role_id) references role (id),
    constraint rolemenuass_ibfk_2
        foreign key (menu_id) references menu (id)
);

create index menu_id
    on rolemenuass (menu_id);

create table userroleass
(
    id      bigint auto_increment
        primary key,
    user_id bigint null,
    role_id bigint null,
    constraint role_id
        unique (role_id, user_id),
    constraint userroleass_ibfk_1
        foreign key (role_id) references role (id),
    constraint userroleass_ibfk_2
        foreign key (user_id) references user (id)
);

create index user_id
    on userroleass (user_id);



-- insert into teacher(TeacherNo,name,IDCard,phoneNumber,degree_id,department_id,title_id) values('01100','徐杰','371525198612233700','110',2,1,2);
-- insert into teacher(TeacherNo,name,IDCard,phoneNumber,degree_id,department_id,title_id) values('01101','王芳','371525198909133780','120',3,1,2);
-- insert into teacher(TeacherNo,name,IDCard,phoneNumber,degree_id,department_id,title_id) values('01102','陆峰','371525197904113680','119',1,1,2);


create table course(
             id bigint not null auto_increment,
             courseNo varchar(255) not null unique,
             name varchar(255) not null unique,
             remarks varchar(255),
             credit smallint not null,
             classHour smallint not null,
             examWeek smallint ,
             courseType_id bigint,
	         college_id bigint,
             foreign key(courseType_id) references courseType(id),
             foreign key(college_id) references college(id),
             primary key(id)
);


INSERT INTO course (id, courseNo, name, remarks, credit, classHour, examWeek, courseType_id,college_id) VALUES (1, '01', 'java语言基础', '', 2, 36, 18, 3,1);
INSERT INTO course (id, courseNo, name, remarks, credit, classHour, examWeek, courseType_id,college_id) VALUES (2, '02', 'C语言基础', '', 2, 36, 18, 3,1);
INSERT INTO course (id, courseNo, name, remarks, credit, classHour, examWeek, courseType_id,college_id) VALUES (3, '03', 'java面向对象', '', 3, 36, 18, 3,1);


create table teachingbuilding(
                                 id bigint not null auto_increment,
                                 no varchar(255) not null unique,
                                 description varchar(255) not null unique,
                                 primary key(id)
);

INSERT INTO teachingbuilding (id, no, description) VALUES (1, '01', '科技楼');
INSERT INTO teachingbuilding (id, no, description) VALUES (2, '02', '信息楼');
INSERT INTO teachingbuilding (id, no, description) VALUES (3, '03', '岳阳楼');

create table classroom(
                          id bigint not null auto_increment,
                          no varchar(255) not null ,
                          maximumNumber smallint not null,
                          teachingbuilding_id bigint not null ,
                          foreign key(teachingbuilding_id) references teachingbuilding(id),
                          primary key(id)
);
alter table classroom add constraint unique (no, teachingbuilding_id);


INSERT INTO classroom (id, no, maximumNumber,teachingbuilding_id) VALUES (1, '101', 90, 1);
INSERT INTO classroom (id, no, maximumNumber,teachingbuilding_id) VALUES (2, '102', 90, 1);
INSERT INTO classroom (id, no, maximumNumber,teachingbuilding_id) VALUES (3, '103', 90, 1);

create table teaching(
   id bigint not null auto_increment,
   minimumNumber varchar(255) not null,
   startWeek varchar(255) not null,
   endWeek varchar(255) not null,
   constraint testStart check(startWeek>0  and endWeek <=12 and endWeek>startWeek),
   classroom_id bigint not null ,
   course_id bigint not null ,
   teacher_id bigint not null ,
   term_id bigint not null ,
   periods_id bigint not null ,
   foreign key(classroom_id) references classroom(id),
   foreign key(course_id) references course(id),
   foreign key(teacher_id) references teacher(id),
   foreign key(term_id) references term(id),
   foreign key(periods_id) references periods(id),
   primary key(id)
);

alter table teaching
add weekday bigint not null;
alter table teaching add constraint check ( teaching.weekday>0 and teaching.weekday<=7)
-- alter table teaching add constraint check ( teaching.weekday>0 and teaching.weekday<=7)
-- 老师时间不能冲突
alter table teaching
    add constraint testRoom
        unique (classroom_id, periods_id, term_id, weekday);
-- 教室时间不能冲突
alter table teaching
    add constraint testTeacher
        unique (teacher_id, periods_id, term_id, weekday);



INSERT INTO teaching (id,minimumNumber,startWeek,endWeek,classroom_id,course_id,teacher_id,term_id,periods_id,weekday)
VALUES (1, '30', '1', '16', 1, 1, 1, 1, 1, 1);
INSERT INTO teaching (id,minimumNumber,startWeek,endWeek,classroom_id,course_id,teacher_id,term_id,periods_id,weekday)
VALUES (2, '60', '1', '16', 2, 2, 2, 3, 1, 2);

create table exam(
                     id bigint auto_increment,
                     score varchar(10) not null,
                     student_id bigint not null ,
                     teaching_id bigint not null ,
                     primary key(id),
                        unique (student_id, teaching_id),
                     foreign key(student_id) references student(id) ,
                     foreign key(teaching_id) references teaching(id)
);
INSERT INTO exam (`id`, `score`, `student_id`, `teaching_id`) VALUES (1, '60', 1, 1);
INSERT INTO exam (`id`, `score`, `student_id`, `teaching_id`) VALUES (2, '90', 2, 1);



create table appeal
(
    id bigint auto_increment primary key,
    remarks varchar(255) not null,
    new_score varchar(10) not null,
    exam_id bigint not null,
    appealStatus_id bigint not null,
    constraint appeal_ibfk_1
        foreign key (exam_id) references exam (id),
    constraint appeal_ibfk_3
    	check(new_score>=0 and new_score<=100),
    constraint appeal_ibfk_2
        foreign key (appealStatus_id) references appealstatus (id)
);

create index appealStatus_id
    on appeal (appealStatus_id);

create index exam_id
    on appeal (exam_id);

INSERT INTO appeal (id,remarks,new_score,exam_id,appealStatus_id) VALUES (1, '差点挂科，分数太低', '62', 1, 2);
INSERT INTO appeal (id,remarks,new_score,exam_id,appealStatus_id) VALUES (2, '分数和实际水平不符', '60', 2, 2);



------------------------------------------------------权限管理动态菜单

create table menu
(
    id          bigint auto_increment
        primary key,
    description varchar(255) not null,
    no          varchar(255) not null,
    url         varchar(255) not null,
    constraint menu_no_uindex
        unique (no)
);


create table role
(
    id          bigint auto_increment
        primary key,
    no          varchar(255) not null,
    description varchar(255) not null,
    constraint Role_no_uindex
        unique (no)
);



create table user
(
    id       bigint auto_increment
        primary key,
    username varchar(255) not null,
    password varchar(255) not null,
    actor_id bigint       not null,
    constraint user_username_uindex
        unique (username),
    constraint user_ibfk_1
        foreign key (actor_id) references actor (id)
);
create index actor_id
    on user (actor_id);


create table userroleass
(
    id      bigint auto_increment
        primary key,
    user_id bigint null,
    role_id bigint null,
    constraint role_id
        unique (role_id, user_id),
    constraint userroleass_ibfk_1
        foreign key (role_id) references role (id),
    constraint userroleass_ibfk_2
        foreign key (user_id) references user (id)
);
create index user_id
    on userroleass (user_id);

create table rolemenuass
(
    id      bigint auto_increment
        primary key,
    role_id bigint null,
    menu_id bigint null,
    constraint role_id
        unique (role_id, menu_id),
    constraint rolemenuass_ibfk_1
        foreign key (role_id) references role (id),
    constraint rolemenuass_ibfk_2
        foreign key (menu_id) references menu (id)
);

create index menu_id
    on rolemenuass (menu_id);



-- teacher
-- department
-- school
-- user
-- course
-- teaching
-- student
-- administrator
-- college
-- classroom
-- teachingbuilding
-- coursetype
-- term
-- actor
-- periods
-- exam
-- degree
-- title
-- appeal
-- appealstatus
