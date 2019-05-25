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
