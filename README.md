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

You cannot sign up as an admin user, however the admin user can be assigned by using the existing admin accounts to edit the user profile (set the user type from "User" to "Admin").

You can log in as a Precinfigured Admin, Admin, or Library Member. The usernames and passwords we preconfigured in the system is as following:
  
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

####Special test case A: The system can handle the scenario where an admin deletes a room that has a reservation.


####Special test case B: The system can handle the scenario that admins delete library member who have currently reserved a room.

#### Extra credit features
The admin can make multiple reservations for a library member. 


####Matters needing attention
1. When an admin changes his/hers status to user, he/she has no authority to update him/herself to admin again. Only the preconfigured admin has the authority to update user back to admin.     
2. When an admin/user does not log in, it will only show the number of the room and the admin/user can not see other information.  
3. An admin can change the bookings of preconfigured admin and users, and users cannot change the bookings of amin and preconfigure admin.  
4. The booking history will always be recorded which will be show at 'My reservation', even if the booking is over.
5. The status of the room will change from 'booked' to 'available' if the reservation is deleted. 
6. The booking time is quite flexible, which can be one hour and two hours, and the start time can be from **:00, **:15, **:30, and **:45.  
7. When users finish the booking early, they can delete the booking manually by deleting his booking record. Also when the booking time is over, the room will be released automatically.  
8. When the room is booked beyond one week from present day, it will show prohibit error 'Start time cannot be booked beyond a week'.  
9. The booking history for a particular user is stored in 'My Reservation' 
  

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



