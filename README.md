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

####The database is empty now and needs to add Preconfigured Admin, Admin, Library Members and Rooms. 

The preconfigured Admin needs to be assigned in the command window for safety. 
First, a user account needs to be signed up in the website with his/her email, password, name, address and telephone number. Then set this user as the configured member in the rails console using the following commands.  
`rails console`  
`User.connection`  
`@user = User.last`  
`@user.user_type = 1`  
`@user.save`  
`exit`  

####Special case A: The system can handle the scenario where an admin deletes a room that has a reservation.
When a room is deleted, the reservations for that room will be deleted too.


####Special case B: The system can handle the scenario that admins delete library member who have currently reserved a room.
When a account is deleted, the reservations made by that account will be deleted too.

####Matters needing attention
1. In the "/roms/(room id)/bookings" page, the account name for the booking will only show to the owner of the booking and the admin users. Neither will the unlogged user see the booking name.
2. If the reservation expired, it will not show in the "/roms/(room id)/bookings" page.
3. All the booking records will be recorded in "/users/(user id)/reservations", even if the reservation expired.
4. In the "/rooms/(room id))" page, the status info shows the usage infomation of the room at the current time. If the room is currently in use, it will shows "Booked", vise versa. If the room is booked and the current reservation is deleted, the room status will be updated automatically from "Booked" to "Available" 
5. The booking time be one hour and two hours, and the start time can be from "**:00", "**:15", "**:30", and "**:45".  
6. When users finish the booking early, they can delete the booking manually by deleting his booking record. Also the room will be released automatically, when the booking time is over.  
7. All the bookings are limited to start within on week since current time. 
8.User can use advanced search to search room using name, size, status and location, there is no requirements for using how many criteria. Also they can search by room name at the root page.
9. If user book the room for a invalid date, such as "September 31st", the system will automatically search for the next valid date, for this case is "October 1st".
10. The User List "/users" page can be access by all the admin user and they can access all the users' and admins' booking history in that page.

####User Permissions
1. Preconfigured admin:  
Account can only be delete in console window for safety and cannot be delete on the website.  
Edit and view own profile  
Edit, view and delete everyone else's account and profile 
Add new library member or admin while logging in  
Add room with corresponding room number, building and size   
Book room
Book room on behalf of others 
Delete other's booking reservation  
View the other's booking history of a room
Delete a room from the system 
View the future reservations for a particular room (with booking account name)

2. Admin:
Edit and view his/her account and profile  
Edit and delete everyone's account and profile except preconfigured admin 
Add new library member or adimins while logging in  
View everyone's profile  
Add room with corresponding room number, building and size  
Book room
Book room on behalf of others
Delete other's booking reservation  
View the other's booking history of a room
Delete a room from the system    
View the future reservations for a particular room (with booking account name)

3. Library Member:  
Edit, view and delete only his/her account and profile    
Book room
Delete only his/her booking reservation  
View the only his/her booking history of a room
View the future reservations for a particular room (without booking account name)


