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

```SQL
    
```
## 2.2 表的操作

# 三、 DML(数据操作语言)

