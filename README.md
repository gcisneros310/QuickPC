# Quick PC

Quick PC is a dedicated mobile application/webapp for finding PC Components and making price lists written in Dart using Flutter.

## Introduction

The application is designed to help users compare prices and compatibility of PC components. Our app can recommend parts based on the user’s budget and consider what they want to use the PC for. The app can also compare prices from different retailers to find the best deal for users looking for parts. 

Due to the covid pandemic, many people have gained interests in building a computer from scratch. Our mobile application intends to assist people in learning the different types of PC components and their respective prices through the use of our mobile application. No such applications are widely available for mobile devices at the moment and the best version of this type of software is typically in the form of a mobile website which is unintuitive to use.

Quick PC will start up asking the user to login to their already registered account or register for a newly made account. Once a user has signed into their account they will arrive at the home screen which is the launch screen. This main page acts as the entry point into our application. 
This screen features a guide on how to assemble a PC, a page on what each part of a PC does, performance comparison on certain parts, a search bar for looking up parts, a system builder, and the ability to browse by parts. 

The end goal of Quick PC is to give users an accessible and informative way to build and assemble a computer that fits their needs. The app can act as a gateway to learning about PC components and understanding the functions of each part.

## App Walkthrough
User is prompted to the splash screen when opening up the application for the first time

<img src="https://user-images.githubusercontent.com/66815273/147521451-e0027db3-f3b9-401a-8795-26e1e765ddc7.png" width="200" height="400">

After clicking the "Get Started" Button, user is directed to the login page. In the login page, users can login using an existing account, reset their password, or create a new account.

<img src="https://user-images.githubusercontent.com/66815273/147521860-74903486-2b09-413c-bba8-22ff6cfc4f58.png" width="200" height="400">

If the user clicks on "Sign Up", they are directed to the sign up page.

<img src="https://user-images.githubusercontent.com/66815273/147522063-70e05748-a654-472f-9917-83dcd9f48dab.png" width="200" height="400">

After logging in to a existing account, user is directed to the home page. In the home page, users are able to access the Notifications, Search Parts, Build PC, Build Guides, Existing Builds, Trending/Popular Products, and the Account Page

<img src="https://user-images.githubusercontent.com/66815273/147522193-77c78f85-11df-4445-a1c4-8a5ee80f8f17.png" width="200" height="400">

User can access the application's notifications by clicking on the notification bell. Notifications are retrieved from the realtime database

<img src="https://user-images.githubusercontent.com/66815273/147617356-5e8cc47c-97f1-4a5c-827b-1ee744c95479.png" width="200" height="400">

The homepage also consist of a bottom navigation bar that consist of the user current saved builds and account settings
In the user saved builds, users are able to edit any of the saved builds or remove them from the list.

<img src="https://user-images.githubusercontent.com/66815273/147617381-40c9d6ec-1bf6-481a-b641-341e08d6874f.png" width="200" height="400">

In the account settings, users are able to change their password, delete the account, logout, report a bug, send feedback, access terms of service, and access privacy policy.

<img src="https://user-images.githubusercontent.com/66815273/147617388-95572ae7-a29b-416e-8188-6a58a30c8a9e.png" width="200" height="400">

One of the main features of our application is searching for a specific part. By clicking on "Search", users are directed to a list of different components such as CPU, memory, motherboard, storage, graphics card, case, power supply, and CPU cooler. If let's say CPU is chosen, users are then directed to a list of CPU. Users are able to filter and even compare parts

<img src="https://user-images.githubusercontent.com/66815273/147617562-242dce53-37db-498b-8220-a949a67cf462.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147617571-70c9c97d-84e1-4c90-b4ce-95ff61df75f3.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147617625-31ed4757-8385-4ad4-8567-049c9f506adb.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147617662-903dce87-315a-483a-872e-6f3ecb2ce3e3.png" width="200" height="400">

If the user wants to view the specifications of the part, user can click it and will be direcdted to the InfoPage. The InfoPage will consists of all the specifications, price, and even the reviews. Users are able to access the reviews page by clicking on "View Reviews". Users are also able to write a review by clicking on "Write a Review". Part information and reviews are also stored in our realtime database.
 
 <img src="https://user-images.githubusercontent.com/66815273/147617812-a58ee57e-173d-4708-aae9-37b606a0f639.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147617814-ced91f86-077a-4cef-b0ce-7479a52d0fb2.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147617817-13317bdf-63cb-4089-b783-093710a56a6d.png" width="200" height="400">
 
Another core feature we had in our application was the ability to create a list of parts and save it. If the user chooses "Build PC", they are directed into the PcPartList page. In the PCPartList page, users are able to search for a part and add it into the list, remove the part, edit the price (if there are cheaper options), and add a custom part. At the bottom of the screen, a total price for the current part chosen is given. 

<img src="https://user-images.githubusercontent.com/66815273/147618108-bb125c73-a04a-4a6a-b1f9-5f858a453ddb.png" width="200" height="400"> 
 
In order to make it easiest as possible. We included an option on the top right which includes setting a budget, viewing the price chart, saving the list to the account, and view saved lists. 
 
 <img src="https://user-images.githubusercontent.com/66815273/147618113-400abf17-defb-4bf0-a27e-2824f7eaa500.png" width="200" height="400"> 
 
 By clicking on "Saved List to Account", users are able to type in a build title and save it to their account. The pc part list does not to be completely filled to save. 

 <img src="https://user-images.githubusercontent.com/66815273/147618199-7ce2a75e-c018-4717-b00b-3f587656e68f.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147618211-7645fdda-92e8-4b35-8e6d-f179487d00ed.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147618218-160354ff-182f-4e27-bfa6-e758ba38117d.png" width="200" height="400">

In the final feature, we ensured to include a tutorial on how to build a pc from scratch. We tried to be as detail as possible since it may be a bit complicated for a new builder. In our guide we divided into 11 steps to ensure that it is easy to follow. Once the user clicks on "Build Guide", the user is directed to the PC Build Guide. A brief introduction is given. More in depth explanations are given after clicking on "Go to Guide" 

 <img src="https://user-images.githubusercontent.com/66815273/147618361-7873b133-839c-4e11-9489-87dd6491a6d1.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147618368-1a451863-bbd5-48a3-90e2-6fd7db3ecf5a.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147618375-adc7e34c-1140-40dc-9681-220d2ae1ec61.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/66815273/147618419-2c392525-90b1-4c70-af52-6f27de363b26.png" width="200" height="400">

## Conclusion
In future development, we plan on: 
- Implementing an API to retrieve the price history of each part
- Ensuring components are compatible with each other
