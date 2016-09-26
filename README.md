README
=====
####The library_room repository creates a room booking web application system where admins and library member can sign up and edit their profiles and also can reserve diverse rooms in different buildings under corresponding regulations.   

####Ruby and rails version

 ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
   
 Rails 5.0.0.1

###Online Deployment  
####Development Instructions
Use Heroku as the online development framework. The link of the room booking web application system is  

`https://floating-taiga-45578.herokuapp.com/`

You cannot sign up as admin user, however the admin user can be assigned by using the existing admin accounts to edit the user profile (set the user type from "User" to "Admin").

You can log in as Precinfigured Admin, Admin, or Library Member. The usernames and passwords we preconfigured in the system is as following:
  
Preconfigured Admin account: trump@gmail.com Key: donaldtrump  
Admin account: hillary@gmail.com Key:hillaryclinton  
User account: obama@gmail.com Key:barackobama  


###Local Testing 
####Pre-configuration 
 Download the codes through the Github.  
`git clone https://github.com/LeoJY/library_room.git`    
`bundle install`  
`bundle update`  
`rails server`  
`rake db:migrate` 

####The database is empty now which needs to be added preconfigured Admin, Admin, Library Members and Rooms. 

The preconfigured Admin needs to be created in the command line for safety. 
First, a user account needs to be signed up in the website with his/her email, password, name, address and telephone number. Then set this user as the configured member in the rails console using the following commands.  
`rails console`  
`User.connection`  
`@user = User.last`  
`@user.user_type = 1`  
`@user.save`  
`exit`  


####Advanced Search 
User can use advanced search to search room using name, size and location.  

####User Permissions
1. Preconfigured admin:  
Account can only be delete in console window for safety and cannot be delete on the website.  
Edit and view own profile  
Edit, view and delete everyone else's account and profile 
Add new library member or admin while logging in  
Add room with corresponding room number, building and size   
Book room
Book room on behalf of others 
Delete everyons's booking reservation  
View the everyons's booking history of a room
Delete a room from the system  

2. Admin:
Edit and view his/her account and profile  
Edit and delete everyone's account and profile except herself/himself and preconfigured admin  
Add new library member or adimins while logging in  
View everyone's profile  
Add room with corresponding room number, building and size  
Book room
Book room on behalf of others
Delete everyons's booking reservation  
View the everyons's booking history of a room
Delete a room from the system    

3. Library Member:  
Edit, view and delete his/her account and profile    
View everyone's profile  
Book room
Delete his/her booking reservation  
View the his/her booking history of a room


####Matters needing attention
1. When users finish the booking early, they can delete the booking manually by deleting his booking record. Also when the booking time is over, the room will be released automatically.  
2. When the room is booked beyond one week from present day, it will show prohibit error 'Start time cannot be booked beyond a week'.  
3. When choosing 'Show all Bookings', it will show the booking time of the definite room, the user name who is booking the room and its status. 
4. When viewing the reservation history of library member, directly choose 'See All Bookings' and see the library member.  
5. The root path website of 'Library Room Booking' shows 'Room Number', 'Show all bookings' and 'Add booking'. 
6. The booking history for a partcular user is stored in different rooms' booking history 



