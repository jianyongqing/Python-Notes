/* 1. DDL(数据定义语言) */
-- 创建数据库SRS
drop database if exists SRS;
create database SRS default charset utf8;

-- 切换到SRS
use SRS;

-- 创建学院表
create table tb_college
(
collid int not null auto_increment comment '学院编号',
collname varchar(50) not null comment '学院名称',
collmaster varchar(20) not null comment '院长姓名',
collweb varchar(511) default '' comment '学院网站',
primary key (collid)
);

-- 添加唯一性约束
alter table tb_college add constraint uni_college_collname unique (collname);
-- alter table tb_college drop index uni_college_collname;

-- 创建学生表
create table tb_student
(
stuid int not null comment '学号',
stuname varchar(20) not null comment '学生姓名',
stusex bit default 1 comment '性别',
stubirth date not null comment '出生日期',
stuaddr varchar(255) default '' comment '籍贯',
collid int not null comment '所属学院编号',
primary key (stuid)
);

-- 添加外键约束
alter table tb_student add constraint fk_student_collid foreign key (collid) references tb_college (collid);

-- 创建教师表
create table tb_teacher
(
teacherid int not null comment '教师工号',
tname varchar(20) not null comment '教师姓名',
ttitle varchar(10) default '' comment '职称',
collid int not null comment '所属学院编号'
);

-- 添加主键约束
alter table tb_teacher add constraint pk_teacher primary key (teacherid);

-- 添加外键约束
alter table tb_teacher add constraint fk_teacher_collid foreign key (collid) references tb_college (collid);

-- 创建课程表
create table tb_course
(
courseid int not null comment '课程编号',
cname varchar(50) not null comment '课程名称',
ccredit tinyint not null comment '学分',
tid int not null comment '教师工号',
primary key (courseid)
);

-- 添加外键约束
alter table tb_course add constraint fk_course_tid foreign key (tid) references tb_teacher (teacherid);

-- 创建学生选课表
create table tb_score
(
scid int not null auto_increment comment '选课编号',
sid int not null comment '学号',
cid int not null comment '课程编号',
selectdate datetime comment '选课时间日期',
score decimal(4,1) comment '考试成绩',
primary key (scid)
);

-- 添加检查约束(MySQL中检查约束不生效)
alter table tb_score add constraint ck_score_score check (score between 0 and 100);

-- 添加外键约束
alter table tb_score add constraint fk_score_sid foreign key (sid) references tb_student (stuid);
alter table tb_score add constraint fk_score_cid foreign key (cid) references tb_course (courseid);

----------------------------------------------------------------------------------------------------------------------------------------

/* 2. DML(数据操作语言) */
-- 插入学院数据
insert into tb_college 
(collname, collmaster, collweb) values 
('计算机学院', '左冷禅', 'http://www.abc.com'),
('外国语学院', '岳不群', 'http://www.xyz.com'),
('经济管理学院', '风清扬', 'http://www.foo.com');

-- 插入学生数据
insert into tb_student 
(stuid, stuname, stusex, stubirth, stuaddr, collid) values
(1001, '向问天', 1, '1990-3-4', '四川成都', 1),
(1002, '任我行', 1, '1992-2-2', '湖南长沙', 1),
(1033, '任盈盈', 0, '1989-12-3', '湖南长沙', 1),
(1572, '余沧海', 1, '1993-7-19', '四川成都', 1),
(1378, '岳灵珊', 0, '1995-8-12', '四川绵阳', 1),
(1954, '林平之', 1, '1994-9-20', '福建莆田', 1),
(2035, '令狐冲', 1, '1988-6-30', '陕西咸阳', 2),
(3011, '林震南', 1, '1985-12-12', '福建莆田', 3),
(3755, '龙傲天', 1, '1993-1-25', '广东东莞', 3),
(3923, '向天问', 0, '1985-4-17', '四川成都', 3),
(2177, '隔壁老王', 1, '1989-11-27', '四川成都', 2);

-- 插入老师数据
insert into tb_teacher 
(teacherid, tname, ttitle, collid) values 
(1122, '张三丰', '教授', 1),
(1133, '宋远桥', '副教授', 1),
(1144, '杨逍', '副教授', 1),
(2255, '范遥', '副教授', 2),
(3366, '韦一笑', '讲师', 3);

-- 插入课程数据
insert into tb_course
(courseid, cname, ccredit, tid) values 
(1111, 'Python程序设计', 3, 1122),
(2222, 'Web前端开发', 2, 1122),
(3333, '操作系统', 4, 1122),
(4444, '计算机网络', 2, 1133),
(5555, '编译原理', 4, 1144),
(6666, '算法和数据结构', 3, 1144),
(7777, '经贸法语', 3, 2255),
(8888, '成本会计', 2, 3366),
(9999, '审计', 3, 3366);

-- 插入选课数据
insert into tb_score 
(sid, cid, selectdate, score) values 
(1001, 1111, now(), 95),
(1001, 2222, now(), 87.5),
(1001, 3333, now(), 100),
(1001, 4444, now(), null),
(1001, 6666, now(), 100),
(1002, 1111, now(), 65),
(1002, 5555, now(), 42),
(1033, 1111, now(), 92.5),
(1033, 4444, now(), 78),
(1033, 5555, now(), 82.5),
(1572, 1111, now(), 78),
(1378, 1111, now(), 82),
(1378, 7777, now(), 65.5),
(2035, 7777, now(), 88),
(2035, 9999, now(), 70),
(3755, 1111, now(), 72.5),
(3755, 8888, now(), 93),
(3755, 9999, now(), null);

-- 删除数据
delete from tb_student where stuid=2177;

-- 更新数据
update tb_score set score=null where sid=1002 and cid=1111;
