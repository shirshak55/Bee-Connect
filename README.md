# Chat-Ounce
An advance rails user interaction system. Think like its is mini facebook with live chat support. Blogging etc.

# Screenshots

### Registration
![Screenshot](/screenshots/registration.png)
### Chat Room
![Screenshot](/screenshots/chat_room.png)
### Live Chat
![Screenshot](/screenshots/live_chat.png)
### Notifications
![Screenshot](/screenshots/notifications.png)
### Update Profile Page
![Screenshot](/screenshots/updatng_profile.png)

## Features
* Login/Logout
* Registration with password reset
* Registration User Email Verifications
* Ability to post
* Ability To follow
* Live Chat with file attachments
* Group Support (Called University)
* Ability to Search Username
* Good Pagination
* User Profiles
* Live Notifications
* Create Chatrooms
* Live Chatrooms
* Ability to upload avatars
* Ability to comments
* Ability to receive message notifications
* Good flash notifications
* Bootstrap based
* Moderation support
* Roles support

## Installation


### Devlopment
For development we use sqlite. Feel free to use any database like mysql or sqlite or pgsql.

* For windows user you can install imagemagic and add to path and also remember to install redis server on windows. For ubuntu you can follow the guide.

* Clone this repo
```shell
git clone https://github.com/bloggervista/Chat-Ounce.git
```
* Update repository
```shell
sudo apt update
sudo apt install imagemagic
```
* Install Redis Server
```shell
sudo apt install redis-server
```
* Start Redis Server
```shell
sudo service redis-server start
```
* Install Imagemagick
```shell
sudo apt install imagemagick
```
* Start rails built in `Puma` server
```shell
rails s
```
* Seed this database
```shell
rails db:seed
```
* Note this default username and password
```
# You can change default admin username and password from frontend interface or db/seeds.rb file
username: chatounce98@gmail.com
password: chatounce@
```
* Go to your lovely browser and start using this project


### Tips
Use c9 (cloud 9) for testing so you can feel how much effort have been devoured in making it.

## Contribution
I wrote it around 1 years ago but I think many rails dev will like this project. So I have opensources it. Feel free to contribute and I will write the name of contributors on this readme file as a appericaiton. I am very happy to merge.

## Regarding Testing
While making this app I was in hurry so didn't wrote any test. Yeah testing is important. Can someone write tests and PR it so I can merge it and I don't have to waste time on testing future PR.


## Support
I will always support this project but if you need more premium service you can hire freelancer or why not me (just asking)?


## Security
If you discover any security related issue, please email `bloggervista@gmail.com` .

## Donation
Considering the hours spent on developing this project and you might have used it on production please show some small apperication to author by donations. Doner's name will be written on this repo as a mark of apperciation. I do accept cards payment, paypal but I am not writing it here. If you like to donate kindly ping me at `bloggervista@gmail.com` . 
If you are bitcoin user you can send me donations at blockchain `1NJb7cqYqP3nbR5WDjdaVvaduXfg8KEsHG` or `ether` at `0xA583445Acf22604219037D31f2D163B877DAad08`