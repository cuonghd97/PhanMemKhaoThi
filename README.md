# PhanMemKhaoThi

# Cài imutils
`sudo -H pip3 install imutils`  
# 1) Triển khai web server
### Cài đặt môi trường cần thiết 
```
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip 
sudo apt-get install -y python3.5-dev libmysqlclient-dev  memcached libffi-dev libssl-dev
sudo apt-get install -y git nginx
sudo apt-get install docker.io
```
### Tải source code và cài các gói cần thiết để chạy code 
```
git clone https://github.com/cuonghd97/PhanMemKhaoThi.git
cd PhanMemKhaoThi
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo pip3 install -r requirement.txt
```
### Tạo tài khoản Admin
### Cấu hình MySQL server
- cài đặt `sudo apt-get install -y mysql-server` (điền mật khẩu cho tài khoản root)
- đăng nhập vào mysql: `mysql -u root -p` (nhập mật khẩu đã tạo lúc dài đặt)
- tạo database: `CREATE DATABASE PhanMemKhaoThi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`
- tạo tài khoản: `CREATE USER 'smart'@'%' IDENTIFIED BY '123456';`
- phân quyền: `GRANT ALL PRIVILEGES ON smart_class . * TO 'smart'@'%';`
- cập nhật: `FLUSH PRIVILEGES;`
- thoát: `exit;`
- thay 127.0.0.1 bằng IP của SQL server vào file `sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf`
- restart `sudo /etc/init.d/mysql restart`
```
mysql -u root -p
use PhanMemKhaoThi;
insert into can_bo (password, email, tenCanBo, username, is_active, position,is_superuser,first_name,last_name,is_staff,date_joined) values('pbkdf2_sha256$120000$g5frmDlYSxY1$mTT33TGmtMKw2AAQtluVO6T8uTvJowv7SCy2OZZZQ4Q=', 'admin@gmail.com','admin','admin',1,0,0,'','',0,'2018-12-27 04:08:42.483175');
exit;
```
