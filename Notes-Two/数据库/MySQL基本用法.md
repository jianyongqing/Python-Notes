# 一、 MySQL初步

## 1.1 基础知识

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
SHOW PROCESSLIST -- 显示哪些线程正在运行
SHOW VARIABLES -- 显示系统变量信息
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

> 首先先知道查询表中所有数据的语句:`select * from 表名;`

      提示:在mysql中,字符串类型和日期类型都要用单引号括起来: ‘tom’,‘2015-09-04’ ;空值：null

## 3.1 插入操作 insert
```SQL
insert into 表名（列名1，列名2 ...）VALUES(列值1，列值2...);
```

## 3.2 修改操作 update

## 3.3 删除操作 delete


# 四、DQL(数据查询语言)

> 数据查询语言：简称DQL(Data Query Language)，用来查询数据库中表的记录。关键字：select，from，where等











