
# 一、 MySQL初步

## 1.1 基础知识

> 结构化查询语言(Structured Query Language)简称SQL，是一种数据库查询和程序设计语言，用于存取数据以及查询、更新和管理关系数据库系统。 

1. MySQL数据类型

> MySQL支持多种类型，大致可以分为三类：数值、日期/时间和字符串(字符)类型

- 数值类型

- 日期和时间类型

- 字符类型

2. 注释
SQL 支持以下三种注释：
```SQL
# 注释
SELECT *
FROM mytable; -- 注释
/* 注释1
   注释2 */
```

## 1.2 基础操作

```SQL
/* Windows服务 */
-- 启动MySQL
    net start mysql
-- 创建Windows服务
    sc create mysql binPath= mysqld_bin_path(注意：等号与值之间有空格)
    
/* 连接与断开服务器 */

mysql -h 地址 -P 端口 -u 用户名 -p 密码

show processlist -- 显示哪些线程正在运行

show variables -- 显示系统变量信息
```

> 以管理员的身份运行cmd（命令提示符），输入如下命令进入MySQL命令模式：mysql -u root -p

# 二、 DDL(数据定义语言)

> 数据定义语言：简称DDL(Data Definition Language)，用来定义数据库对象：数据库，表，列等。关键字：create，alter，drop等

## 2.1 数据库操作

1. 创建数据库

```SQL
create database 数据库名;

create database if not exists 数据库名; -- 如果不存在则创建 
```

2. 删除数据库

```SQL
drop database 数据库名称;
```

3. 查看MySQL服务器中的所有数据库

```SQL
show databases; -- 查看MySQL服务器中的所有数据库
```

4. 查看某个数据库的定义信息

```SQL
show create database 数据库名;
```

5.使用或切换数据库

```SQL
use 数据库名; -- 使用或切换数据库

select database(); -- 查看当前数据库

select now(), user(), version(); -- 显示当前时间、用户名、数据库版本
```

## 2.2 表的操作

1. 创建表

```SQL
create table 表名(
   字段名 类型(长度) 约束,
   字段名 类型(长度) 约束
);
```

2. 主键约束

主键是用于标识当前记录的字段。它的特点是非空，唯一。在开发中一般情况下主键是 不具备任何含义，只是用于标识当前记录

```SQL
create table 表名(
    id int primary key, -- 在创建表时创建主键,在字段后面加上 primary key
    ....
);

alter table 表名 drop primary key; -- 删除主键

```

3. 查看表

```SQL
show tables; --查看数据库中所有的表

desc 表名; -- 查看表结构

show create table 表名; -- 查看建表语句
```

4. 删除表

```SQL
drop table 表名;
```

5. 修改表结构

```SQL
alter table 表名 drop 列名; -- 删除列

rename table 表名 to 新表名; -- 修改表名

alter table 表名 character set 字符集; -- 修改表的字符集

alter table 表名 change 列名 新列名 列类型; -- 修改列名

alter table 表名 add 列名 列类型; --添加列
```

# 三、 DML(数据操作语言)

> 数据操作语言：简称DML(Data Manipulation Language)，用来对数据库中表的`记录`进行更新。关键字：insert，delete，update等

      提示:在mysql中,字符串类型和日期类型都要用单引号括起来: ‘tom’,‘2015-09-04’ ;空值：null

> 首先先知道查询表中所有数据的语句:`select * from 表名;`

## 3.1 插入操作 insert

```SQL
insert into 表名 values(列值1，列值2,...);

-- 批量插入
insert into 表名 values(列值1，列值2,...),(列值1，列值2,...),...;
```

      注意:
            1.列名与与列值的类型、个数、顺序要一一对应
            2.值不要超出列定义的长度
            3.如果插入空值，请使用null
            4.插入的日期和字符一样，都使用引号括起来
            
## 3.2 修改操作 update

```SQL
update 表名 set 列名1=列值1，列名2=列值2,... where 列名=值;
```

## 3.3 删除操作 delete

```SQL
delete from 表名 [WHERE 列名=值];
```

# 四、DQL(数据查询语言)-非常重要

> 数据查询语言：简称DQL(Data Query Language)，用来查询数据库中表的记录。关键字：select，from，where等

    数据库执行DQL语句不会对数据进行改变，而是让数据库发送结果集给客户端。查询返回的结果集是一张 虚拟表。

```SQL
select 列名 from 表名 [where -> group by -> having -> order by];
```

      select selection_list         要查询的列名称 
      from table_list               查询的表名称
      where condition               行条件
      group by grouping_columns     对结果分组 
      having condition              分组后的行条件
      order by sorting_columns      对结果分组
      limit offset_start, row_count 结果限定

## 4.1 基础查询

```SQL

select * from 表名; -- 查询所有列

select 列名1,列名2,... from 表名; --查询指定列

```

## 4.2 条件查询

      条件查询就是在查询时给出where子句，在where子句中可以使用如下运算符及关键字:
           =、!=、<>、<、<=、>、>=；
           between...and；
           in(set)；
           is null； is not null;
           and;
           or;
           not;

## 4.3 模糊查询

前面介绍的所有操作符都是针对已知值进行过滤的,不管是匹配一个还是多个值,测试大于还是小于已知值,或者检查摸个范围的值,共同点是过滤中使用的值都是已知的.但是,这种过滤方法并不是任何时候都好用,例如当想查询中包含a字母的学生时就需要使用模糊查询了。模糊查询需要使用关键字like.

      在使用like关键字时,通常和通配符(用来匹配一部分的特殊字符)配合使用:
                  1. _ : 匹配任意一个字符
                  2. % : 任意0~n个字符
                  
```SQL
select * from 表名 where 列名 like '_____'; -- 模糊查询必须使用like关键字。其中 “_”匹配任意一个字母，5个“_”表示5个任意字母

select * from 表名 where 列名 like '____i'; --比如查询姓名由5个字母构成，并且第5个字母为“i”的学生记录

select * from 表名 where 列名 like 'z%'; -- 其中“%”匹配0~n个任何字母.比如查询姓名以“z”开头的学生记录

select * from 表名 where 列名 like '_i%'; -- 比如查询姓名中第二个字母是i的学生记录

select * from 表名 where 列名 like '%a%'; -- 比如查询姓名中包含“a”字母的学生记录
```

## 4.4 字段控制查询

```SQL
select distinct 列名 from 表名; -- 去除重复记录（两行或两行以上记录中系列的上的数据都相同）,需要使用distinct.

select *,列名1+列名2 from 表名; -- 如果列名1或列名2中有一个字段不是数值类型，那么会出错.

-- 如果列2有很多记录的值为NULL，因为任何东西与NULL相加结果还是NULL，所以结算结果可能会出现NULL。下面使用了把NULL转换成数值0的函数ifnull:
select *,列1+ifnull(列2,0) from 表名;

-- 在上面查询中出现列名为列1+ifnull(列2,0)，这很不美观，现在我们给这一列给出一个别名，为total：
select *,列1+ifnull(列2,0) as total from 表名; -- 给列起别名时，是可以省略as关键字的：select *,列1+ifnull(列2,0) total from 表名
```

## 4.5 排序

排序使用`order by 列名 asc/desc`作为语法;默认是asc(升序) 可以指定 desc 降序

Practice:
```SQL
select * from stu order by age asc; -- 查询所有学生记录，按年龄升序排序

select * from stu order by age desc; -- 查询所有学生记录，按年龄降序排序

select * from emp order by sal desc,empno asc; -- 查询所有雇员，按月薪降序排序，如果月薪相同时，按编号升序排序
```

## 4.6 聚合函数

> 聚合函数是用来做纵向运算的函数

      count()：统计指定列不为NULL的记录行数；
      max()：计算指定列的最大值，如果指定列是字符串类型，那么使用字符串排序运算；
      min()：计算指定列的最小值，如果指定列是字符串类型，那么使用字符串排序运算；
      sum()：计算指定列的数值和，如果指定列类型不是数值类型，那么计算结果为0；
      avg()：计算指定列的平均值，如果指定列类型不是数值类型，那么计算结果为0；

## 4.7 分组查询

> 当需要分组查询时需要使用group by子句

      注意: 
      凡是和聚合函数同时出现的列名，一定要写在group by之后 
      分组时候是无法体现单个数据的 
      group by一般会合聚合函数配合使用,单独使用的时候意义不大

Practice:
```SQL
select deptno, sum(sal) from emp group by deptno; -- 查询每个部门编号和每个部门的工资和

select deptno,count(*) from emp group by deptno; -- 查询每个部门的部门编号以及每个部门的人数

select deptno,count(*) from emp where sal>1500 group by deptno; -- 查询每个部门的编号以及每个部门工资大于1500的人数

select deptno, sum(sal) from emp group by deptno having sum(sal) > 9000; --查询工资总和大于9000的部门编号以及工资总和

select job,deptno,avg(sal) from emp group by job, deptno having avg(sal) > 1000; -- 统计出各个部门的各个岗位中,平均工资>1000的信息
```

      having和where的区别 
      1. having是在分组后对数据进行过滤,而where是在分组前对数据进行过滤 
      2. having后面可以使用聚合函数(统计函数),where后面不可以使用聚合函数
      where是对分组前记录的条件，如果某行记录没有满足WHERE子句的条件，那么这行记录不会参加分组；而having是对分组后数据的约束
      
      select --> from --> where --> group by --> having --> order by

## 4.8 Limit

> limit用来限定查询结果的起始行，以及总行数。

```SQL
select * from 表名 limit 0,5; -- 查询5行记录，起始行从0开始
```

> 查询语句的书写顺序: `select – from - where - group by - having - order by -limit`<br/>查询语句的执行顺序: `from - where - group by - having - select - order by - limit`

# 五、 DCL(数据控制语言)

> 数据控制语言：简称DCL(Data Control Language)，用来定义数据库的访问权限和安全级别，及创建用户

```MySQL
-- 创建名为hellokitty的用户
create user 'hellokitty'@'localhost' identified by '123123';

-- 将对SRS数据库所有对象的所有操作权限授予hellokitty
grant all privileges on SRS.* to 'hellokitty'@'localhost';

-- 召回hellokitty对SRS数据库所有对象的insert/delete/update权限
revoke insert, delete, update on SRS.* from 'hellokitty'@'localhost';
```

# 六、多表查询





