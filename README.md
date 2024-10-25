# Project Overview
This is an application for students at UNC Charlotte to enhance campus security and commmunication. Users are able to report lost items, contact emergency services (phone numbers commented out to prevent spam), and stay updated on any campus alerts. 

By giving students direct communication with emergency services and campus staff, it gives the students sense of security with ability to report things in real-time. The app aims to improve campus security and further the communication between students and campus police.

### Key Features:
- Report lost items on campus.
- Contact emergency services (phone numbers protected from spam).
- View real-time alerts from campus police.

# Setup Instructions
1) Make Sure to have Android Studio Installed. If not, go to [Android Studio](https://developer.android.com/studio) to download the application. If currently have Android Studio it is reccommended to update it through the download.
2) Check for Flutter SDk is installed in Environment Variable for current user Path. If not, go to [Flutter.com](https://docs.flutter.dev/get-started/install/windows/mobile) to dowload the SDK and follow the instructions provided.
3) Open Android Studio, at the top click Tools and click on SDK Manager. Please ensure you have the API 34 SDK to work this program. If not, please download it.
4) Now, open up a blank flutter project in android studio and in the terminal at the bottom enter "git pull https://github.com/yibab/niner_security". This will install the master branch into your current project.
5) Run "flutter pub" get in the terminal to get the dependencies.
6) Please make sure you have also a virtual device setup. On the righthand side there should be a "Device Manager" press it, and press the "+" to create a virtual device phone with the playstore.
7) Lastly, run "./pocketbase serve". This allows communication with the database so ensure to run this command in the terminal each time you re-enter Android Studio for the application.
8) If not use to how to run programs in Android Studio, press the play button in the top right side to run the app.

# Usage Details
### Sign Up:
- Tap on the 'Sign Up' text on the login page
- Enter name, email, password, password confirm
- Email must be an UNC Charlotte email
- Password must be no shorter than 8 characters and no longer than 72 characters
- Press 'Sign Up' to sign up
### Sign In:
- Enter correct email and password
- Press 'Sign In' to sign in
### Home:
It is currently in development and will serve as the main hub for the app. So the functionality for it right now is:
- Access to Navigation to the other pages
### Emergency Services:
It is currently in development and will serve as the area to get in touch of emergency services on campus. The functionality for it right now is:
- Access to contact campus police
- Access to get in touch with any other emergency service avaliable on campus
### Niner Alerts:
It is currently in development and will serve as the area to look at any alerts that campus police have put out. The functionality for it right now is:
- A list of campus police reports that the students can look at
### Lost & Found:
It is also in development and will serve as the are to send posts and users to look at posts of people who are missing things. The functionality for it right now is:
- A form to report lost items including item description, location, and contact information
- List of items that are either found or still missing


# Team's Progress
Currenlty we are working on the admin dashboard to display posts made by the users.