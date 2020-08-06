#EC2インスタンスを作成する際に記述するユーザーデータ。

#!/bin/bash

# ホスト名
sed -i 's/^HOSTNAME=[a-zA-Z0-9\.\-]*$/HOSTNAME=udemy-aws-14days-db-1a/g' /etc/sysconfig/network
hostname 'udemy-aws-14days-db-1a'

# タイムゾーン
cp /usr/share/zoneinfo/Japan /etc/localtime
sed -i 's|^ZONE=[a-zA-Z0-9\.\-\"]*$|ZONE="Asia/Tokyo”|g' /etc/sysconfig/clock

# 言語設定
echo "LANG=ja_JP.UTF-8" > /etc/sysconfig/i18n

#ユーザーデータここまで


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

