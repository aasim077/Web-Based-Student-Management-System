SELECT * FROM project1.student;
use project;
create table course(cid varchar(45) primary key, cname varchar(120) not null unique);
create table branch(bid varchar(45) primary key, bname varchar(120) not null unique, cid varchar(45), foreign key(cid) references course(cid));
select * from course;
delete from course where cid='BTI';
select * from country;
select * from preson_cbranch;
create table country (id int primary key auto_increment,name varchar(100) not null unique);
insert into country (name) value('Nigeria');
create table city (id int primary key auto_increment, cityname varchar(100) not null unique,cid int, foreign key (cid) references country(id) );
insert into city (cityname,cid) value('Logan City',(select id from country where name='Australia'));
delete from city where cid=2;
delete from country where name='Africa';
create table person (roll varchar(15) primary key, name varchar(120) not null ,fname varchar(120) not null,gender varchar(10) not null,dob date not null,email varchar(120) not null unique,mobile varchar(10) not null unique);
alter table person add column(address varchar(300) not null);
alter table person add column(city int not null,country int not null);

create table person_cbranch (roll varchar(15) primary key, cid varchar(5) not null,bid varchar(5) not null, foreign key (cid) references course
(cid),foreign key(bid) references branch(bid));
create table person_ccity (roll varchar(15) primary key, countryid int not null,cityid int not null, foreign key (countryid) references country
(id),foreign key(cityid) references city(id));
select* from project.person;
select* from result;
select* from branch;
delete from person where roll='PU-002';
create table result(pid int primary key auto_increment,mid int not null unique,foreign key(mid)references marks(mid), roll varchar(45) not null ,foreign key (roll)references person(roll),status varchar(10) not null,percent float not null,grade varchar(3) not null);
create table subjects(course varchar(45) not null,branch varchar(45) not null,foreign key(course) references course(cname),foreign key(branch) references branch(bname),sem int not null ,years int not null,s1 varchar(100) not null,s2 varchar(100) not null,s3 varchar(100) not null,s4 varchar(100) not null,s5 varchar(100) not null);
insert into subjects (course,branch,sem,years,s1,s2,s3,s4,s5) value((select cname from course where cid='BTI'),(select bname from branch where bid='CSE'),1,1,'C Programming','Maths-1','Chemistry','Open Source & Standards','Communication skills');
alter table subjects add column (id int primary key auto_increment);
create table marks (mid int primary key auto_increment, roll varchar(45) not null,id int not null,foreign key(roll) references person(roll),foreign key (id)references subjects(id),m1 float not null,m2 float not null,m3 float not null,m4 float not null,m5 float not null);
select p.roll,s.s1,m.m1,s.s2,m.m2,s.s3,m.m3,s.s4,m.m4,s.s5,m.m5,p.percent,p.grade,p.status from  result p  inner join marks m  on m.roll=p.roll  inner join subjects s on m.id=s.id ;
select p.roll,name,fname,gender,dob,email,mobile,address,cid,bid from person p  ;
create table student_login (username varchar(65) not null,pass varchar(45) not null,roll varchar(45) primary key);
insert into student_login value('PU-002','9696','PU-002');
Select p.roll,p.name,p.fname,p.gender,p.dob,p.email,p.mobile,p.address,p.city,p.country,c.cid,c.bid,(select cname from course where cid=c.cid),(select bname from branch where bid=c.bid),(select name from country where id=p.country ),(select name from city where id=p.city ) from person p inner join person_cbranch c on p.roll=c.roll where p.roll='PU-001';
Select p.s1,p.s2,p.s3,p.s4,p.s5,m.m1,m.m2,m.m3,m.m4,m.m5,r.percent,r.grade,r.status from subjectS p inner join marks m on p.id=m.id inner join result r  on m.mid=r.mid  where r.roll='PU-001';
select * from person p inner join person_cbranch c on p.roll=c.roll ;