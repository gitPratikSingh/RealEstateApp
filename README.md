# README
 
## How to Test This Application
The following is an enumerated list of each requirement layed out in the document, and a mechanism to test it. For the grader's convenience, the application comes pre-seeded with a number of useful models, which we will reference over the course of this guide. They can be found in the /db/seeds.rb file.

## Understanding Our User - Role System
In this application, people make users using Devise. Those users can take on Roles, which has specific views and privileges associated with it. When logged in as an Administrator, you will always have access to admin functionality, but may assume House Hunter and Realtors roles to interact with the site as though you were either. You can do this by clicking the buttons 'Make a Househunter Account' or 'Make a Realtor' account, and then 'Go to Your HouseHunter Profile' or 'Go to Your Realtor Profile'. If you click the Go to Profile buttons, you will act in the system as those roles, despite being an admin (This will let you test all the functionality in the system while being logged in as a single user, if you so desire.) To regain your admin powers, please navigate to the start_page and click 'Return to Admin View'.

### How to Test Admins
* Log in with email and password.
1. Log in as admin1@dm.com with password 'admin1@dm.com'.
Success: you are now logged in as admin1@dm.com.

* Edit their own profile.
1. While logged in as admin1@dm.com, click Edit_profile at the top of the screen.
2. Enter your Current password into the Current password field. 
3. Change another field's value
4. Click Update.
5. Once on the home screen again, click Edit profile.
Success: You see whatever change you made persisted.

* Create realtor and house hunter accounts.
1. After logged in as admin1@dm.com, click "Admin Home Page".
2. From the actions menu, you can click on the links "createRealtor" and "createHouseHunter" to create realtor and house hunter accounts.

* Create real estate company
1. After logged in as admin1@dm.com, click "Admin Home Page".
2. From the actions menu, you can click on the link "createRealEstateCompany" to create a Real Estate Company

* View the list of users and their profile details (except password)
1. After logged in as admin1@dm.com, click "Admin Home Page".
2. From the actions menu, you can click on the link "viewAllUsers" to view the list of all users. Click on the "Edit" to edit any user you desire.

* View the list of real estate companies, along with detailed information.
1. After logged in as admin1@dm.com, click "Admin Home Page".
2. From the actions menu, you can click on the link "viewAllRealEstateCompanies" to view the list of all Real Estate Companies with all the details.

* View the list of houses, along with detailed information.
1. After logged in as admin1@dm.com, click "Admin Home Page".
2. From the actions menu, you can click on the link "viewAllHouses" to view the list of all houses with all the details.

* View all fields of inquiries (defined below) from house hunters.
1. After logged in as admin1@dm.com, click "Admin Home Page".
2. From the actions menu, you can click on the link "viewAllInquiries" to view the list of all inquiries with all the details.

* Edit or delete real estate companies/users (realtors or house hunters)/houses/inquiries from the system.
1. After logged in as admin1@dm.com, click "Admin Home Page".
2. From the actions menu, you can click on the lins viewAllRealEstateCompanies/viewAllUsers/viewAllHouses/viewAllInquiries to view the list of all Real Estate Companies/Users/Houses/Inquiries respectively. Click on the Edit/destroy to edit/delete any item you desire.

### How to Test Realtors
A. Sign up as Realtor
 1. Log in as user3@user.com with passowrd '123456'.
 2. Click 'Make Realtor Account'
 3. Choose Real Estate Company from drop down box
 4. Create Realtor
 5. Click Home
Success: You made a Realtor

B. Change to Realtor Role
 1. Do Test A
 2. Select 'Stop Viewing as Any Role'
 3. Select 'View Realtor Profile'
Success: Changed role to Realtor

C. List House
 1. Do Test B:
 2. Select 'List House'
 3. Enter valid information for House fields
 4. Select 'Create House'
Success: List House

D. View All Houses
 1. Do Test B
 2. Select 'View All Houses'

E. Edit Realtor Posted House
 1. Do Test C
 2. Do Test D
 3. Select 'Edit' from the house made in Test C
 4. Edit desired information
 5. Select Update
Success: Edit Realtor Posted House

F. Remove Realtor Listed House
 1. Do Test C
 2. Do Test D
 3. Select 'Destroy' from the house made in Test C
Success: Remove Realtor Listed House
 



### How To Test House Hunters
* Log in with email and password.
1. Log in as user3@user.com with password '123456'.
Success: you are now logged in as user3@user.com.

* Edit their own profile.
1. While logged in as user3@user.com, click Edit_profile at the top of the screen.
2. Enter your Current password into the Current password field. 
3. Change another field's value
4. Click Update.
5. Once on the home screen again, click Edit profile.
Success: You see whatever change you made persisted.

* Search available houses using filters, such as price, square footage range, location.
1. While logged in as user3@user.com and viewing as a house hunter, click View All Houses. This will show you all the pre-seeded houses, plus the ones you may have added. To view as a house_hunter, click Go To Your House Hunter Profile.
2. Go back to your home page, and then click Search Houses.
3. The following success criteria will change if you have added or removed any houses.
4. List Price Low = 1 and List Price High = 300000. All other fields empty. Hit Search.
Success: only see houses with list prices between 1 and 300000. 12345 Home Way should be there if you didn't delete it.
5. Square Footage Low = 5000 and Square Footage High = 8000. All other fields empty. Hit Search.
Success: only see houses with square footages between 5000 and 8000. 7777 Lucky Ct should be there if you didn't delete it.
6. Location = 12345. All Other fields empty. Hit Search.
Success: only see houses which start with 12345. 12345 Home Way should be there if you didn't delete it.
7. Year Built Low = 1600 and Year Built High = 2000. All other fields blank. Hit Search.
Success: only see houses built between 1600 and 2000. 12345 Home Way and 7777 Lucky Ct  should be there if you didn't delete them.
8. Number of Floors Low = 1 and Number of Floors High = 2. 12345 Home Way should be there if you didn't delete it.

* Select houses they are interested in and add them to the house hunter’s interest list.
1. While logged in as user3@user.com and viewing as a house hunter, click View All Houses. This will show you all the pre-seeded houses, plus the ones you may have added.
2. Click Show on a house of your choosing.
3. Click Add To Interest List when the house appears.
4. Verify you travel to a screen which says "Added to Interest List!" and has the location of your house on it.
5. Hit Back to Root.
6. Click View My House Interest List.
Success: See the house you added to your interest list on your interest list.

* View information on all real estate companies
1. While logged in as user3@user.com and viewing as a house hunter, click View All Real Estate Companies.
Success: You can see all real estate companies and their information.

* View information on all houses (except the “potential buyers” attribute)
1. While logged in as user3@user.com and viewing as a house hunter, click View All Houses. This will show you all the pre-seeded houses, plus the ones you may have added.
Success: You can see all real estate companies and their information (but not the Potential Buyers attribute).

* Submit an inquiry for a house they are interested in.
1. While logged in as user3@user.com and viewing as a house hunter, click View All Houses. This will show you all the pre-seeded houses, plus the ones you may have added.
2. Click Show on the House of your choice.
3. Click Submit Inquiry.
4. View screen confirming successful creation of inquiry.
5. Hit back. Click View My Inquiries.
Success: Observe your inquiry is present, and none that you did not submit are present.

* Edit or delete an inquiry they previously submitted.
1. While logged in as user3@user.com and viewing as a house hunter, click View My Inquiries. This will show the inquiry you made in the last test case.
2. Click Edit on the inquiry.
3. Change a field. Hit Submit.
4. See screen with updated field. Hit Back.
5. Click View My Inquiries. 
Success: see field is still changed.
6. Click Destroy on one of your inquiries. Click Ok/Yes when prompted.
7. Success: see that your inquiry is GONE.

