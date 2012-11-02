# README
----

包含前后台的新闻管理系统

前台基于Middleman，后台基于Sinatra

## 技术和框架
* Ruby 1.9.3
* Middleman 3.0.6
* Sinatra 1.3.3
* ActiveRecord 3.2.8
* Sqlite3 1.3.6
* SCSS 

## 安装
1. 根目录运行 bundle install
2. admin目录运行 bundle install
3. admin目录运行 rake db:migrate
4. gem install shotgun


## 运行程序


1. 启动前台

  		$ middleman server

   浏览器访问：http://localhost:4567
	
2. 后台Admin

		$ shotgun app
		
	浏览器访问：http://localhost:9393
	

## 发布

	$ middleman build
	
