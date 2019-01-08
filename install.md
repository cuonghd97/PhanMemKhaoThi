# 1) Triển khai web server
### Cài đặt môi trường cần thiết 
```
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip 
sudo apt-get install -y python3.5-dev libmysqlclient-dev  memcached libffi-dev libssl-dev
sudo apt-get install -y git nginx
```
### Tải source code và cài các gói cần thiết để chạy code 
```
git clone https://github.com/cuonghd97/PhanMemKhaoThi.git
cd PhanMemKhaoThi
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo pip3 install -r requirement.txt
sudo apt-get install libgtk2.0-0
```

### Tạo tài khoản Admin
### Cấu hình MySQL server
- cài đặt `sudo apt-get install -y mysql-server` (điền mật khẩu cho tài khoản root)
- đăng nhập vào mysql: `mysql -u root -p` (nhập mật khẩu đã tạo lúc dài đặt)
- tạo database: `CREATE DATABASE PhanMemKhaoThi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`
- tạo tài khoản: `CREATE USER 'khaothi'@'%' IDENTIFIED BY '123456';`
- phân quyền: `GRANT ALL PRIVILEGES ON PhanMemKhaoThi . * TO 'khaothi'@'%';`
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

### Cấu hình Nginx:
`sudo nano /etc/nginx/sites-available/default`

copy nội dung bên dưới vào:*thay đổi ticket

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;
        client_max_body_size 10M;
        location = /favicon.ico { access_log off; log_not_found off; }

        location / {
                include proxy_params;
                proxy_pass http://0.0.0.0:8000;
        }
        location /static/ {
                root /home/hieu/PhanMemKhaoThi/CoiThi;
        }
        location /media/ {
                root /home/hieu/PhanMemKhaoThi;
        }
}


```
### Tạo Gunicorn systemd Service File
`sudo nano /etc/systemd/system/gunicorn.service`

copy nội dung bên dưới: *thay đổi ticket

```
[Unit]
Description=gunicorn daemon
After=network.target

[Service]
User=root
Group=www-data
WorkingDirectory=/home/hieu/PhanMemKhaoThi
ExecStart=/usr/local/bin/gunicorn --bind 0.0.0.0 -p 8000 PhanMemKhaoThi.wsgi:application --reload

[Install]
WantedBy=multi-user.target

```
### Chạy web server
```
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl start nginx

**Chuyển sang server web ở phần 2 restart lại dịch vụ**
```
sudo systemctl restart gunicorn.service
sudo systemctl restart nginx.service
``` 