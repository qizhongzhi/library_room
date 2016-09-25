README
=====
####The library_room repository creates a room booking web application system where admins and library member can sign up and edit their profiles and also can reseve diverse rooms in different libraries under corresponding regulations. 

####Ruby and rails version

 ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
   
 Rails 5.0.0.1

####System dependencies

####Pre-configuration 
 Download the codes through the Github.  
`git clone https://github.com/LeoJY/library_room.git`  
`rake db:migrate`  
`bundle install`  
`bundle update`  
`rails server`  

The preconfigured Admin needs to be created in the command line for safety. 
First, a user account needs to be signed up in the website with his/her email, password, name ,address and telephone number. Then set this user as the configured member in the rails console using the following commands.  
`rails console`  
`User.connection`  
`@user = User.last`  
`@user.user_type = 1`  
`@user.save`  
`exit`  


####User Permissions
1. Preconfigured admin:  
the account can only be delete in console window for safety.  
edit and view own profile  
edit, view and delete everyone else's account and profile 
add new users or admin while logging in

2. Admin:
edit, view and delete his/her account and profile  
edit and delete everyone's account and profile  except preconfigured admin  
add new users or adimins while logging in  
view everyone's profile  

3. User:  
edit, view and delete his/her account and profile  
view everyone's profile  



* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
