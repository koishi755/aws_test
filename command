#MYSQLをインストールします。
sudo yum install -y mysql57-server
sudo chkconfig mysqld on
sudo service mysqld start
mysqladmin -u root password 

#MYSQLへ接続
mysql -u root –p

#テーブルの作成
create database myblog;
use myblog;


#カラムの作成
create table blog (id int not null primary key, title varchar(100), detail varchar(1000));

#データの挿入
insert into blog values (1, "XXXX", "XXXXXXXXXX");
insert into blog values (2, "YYYY", "YYYYYYYYYY");

#権限付与
grant all privileges on *.* to root@"%" identified by 'password' with grant option; 

#WEBサーバーからMYSQLへ接続
mysql -h DBサーバーのIP -u root -p

