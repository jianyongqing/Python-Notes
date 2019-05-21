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


# 三、 DML(数据操作语言)

