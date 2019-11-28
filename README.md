== README


ruby 2.6.3

gem install bundle

bundle install

# 安装初始化mysql数据库
rake db:create

rake db:migrate 

rake db:seed

# 启动3000端口
rails s

# 访问前台
http://localhost:3000/

账号：1@.com  密码：11111111

# 访问后台
http://localhost:3000/admin/students

账号：2@.com  密码：11111111




# 创建一个类
数据表创建： rails g migration create_student_documents

执行数据库创建脚本： rake db:migrate

增
StudentDocument.create(name:"test")

查
StudentDocument.find(1)
StudentDocument.find_by(name:"test",email:"test@11.com")
StudentDocument.where("id > ? and name != ? ",1,"test")
StudentDocument.select("name","email")
StudentDocument.find_by_sql("select * from student_documents")

删
StudentDocument.first.delete
StudentDocument.where("id > ? and name != ? ",1,"test").delete_all

改

StudentDocument.first.update({email:"test@11.com",name:"test1"})
StudentDocument.where("id > ? and name != ? ",1,"test").update({email:"test@11.com",name:"test1"})


统计：

count size


belongs_to

has_many

has_one

has_and_belongs_to


