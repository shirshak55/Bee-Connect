# Bee Connect (Active)

[![Build Status](https://travis-ci.org/bloggervista/Bee-Connect.svg?branch=master)](https://travis-ci.org/bloggervista/Bee-Connect) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![StyleCI](https://styleci.io/repos/107520275/shield?style=plastic)](https://styleci.io/repos/107520275/shield?style=plastic) [![Patreon donate button](https://img.shields.io/badge/patreon-donate-yellow.svg)](https://patreon.com/shirshak "Donate to this project using Patreon")


An advance rails social netowrking system. Think like its is mini facebook with live chat support. Features like  group , group moderation, group chat, global chat, profile update, post, comments, favorites etc..


# Screenshots

### Registration
![Registration](/screenshots/registration.png)

### Chat Room
![Chat Room](/screenshots/chat_room.png)

### Live Chat
![Live Chat](/screenshots/live_chat.png)

### User Post
![User Post](/screenshots/user_post.png)

### Create Group
![User Post](/screenshots/create_group.png)

### Notifications
![Notifications](/screenshots/notifications.png)

### Update Profile Page
![Update Profile](/screenshots/update_profile.png)

> There are tons of feature . So I don't want to flood this with screenshots. Thanks

## Features
* Latest version of Rail(v5.1.4)
* Login/Logout
* Registration with password reset
* Registration User Email Verifications
* Ability to post
* Ability To follow
* Live Chat with file attachments
* Group Support
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


### Development
For development we recommend to use sqlite. Feel free to use any database like mysql or sqlite or pgsql.

* For windows user you can install imagemagick and add to path and also remember to install redis server on windows. And for database rename `.env.example` to `.env` and adjust that file. For Ubuntu LTS (18.04) you can follow the guide.

* Clone this repo
```shell
git clone https://github.com/bloggervista/Bee-Connect.git
```
* Update repository
```shell
sudo apt update
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
$ sudo apt install imagemagick
```
* Setup Database
```shell
# Install pgsql or any database system you like
$ cp .env.example .env
# After copying please change that file to match database details
```
* Migrate and Seed this database
```shell
$ rails db:migrate
$ rails db:seed
```
* Start rails built in `Puma` server
```shell
$ rails s
```
* Note this default username and password
```
# You can change default admin username and password from frontend interface or db/seeds.rb file
username: admin@admin.com
password: admin@123
```
* Start the sidekiq queue server. If you don't start you will not see live chat like that.
```bash
$ bundle exec sidekiq
```
* Go to your lovely browser and start using this project

### Production
* Compile your asset so that they will be minified and production ready.
```
$ RAILS_ENV=production bundle exec rake assets:precompile
```
* Install Nginx
* Use capistrano if you like
* Point Nginx to public folder of this project
* Go to `config/database.yml` and adjust the database settings
* Go to `config/environment/production.rb` and enter your website address or ip
* Go to `config/initializer/devise.rb` change `config.mailer_sender` and `config.secret_key` to your appropriate settings

### Testing
* To run tests:

```
Will be added soon
```
### Tips
If you are windows user we recommend you to use Cloud9 online IDE or use rails installer.

## Contribution
Feel free to contribute and we are very happy to merge your PR.


# Future of this project
* Use Tabler as admin panel
* Using webpack and use react js
* Fully documentation for every parts
* Social Login with facebook, github, twitter etc.
* Fully Developed backend. Right now admin can only delete post he cannot monitor user
* Roles and Permissions
* Ability to Upload Videos
* Adding emoticons support.
* Ability to send weekly mails
* Support to latest version of rails. (at the time or writing Rails 5.1)
* Ability to create various form by admin like contact form etc.
* Fully test with chrome headless browser and 90% code coverage
* Advertisement support
* Payments with leading provider like paypal, stripe.
* API For mobile devices
* JWT based authentication for mobile device

> Or you can PR us about these feature
> Please don't abuse this project by adding this to marketplace like codecanyon. Actually that really sucks :(

## Support
Latest version of rails will be supported.

## Security
If you discover any security related issue, please email `bloggervista@gmail.com` . All security issues will be addressed properly.

## Contributors
Lead Contributor: Gary Traffanstedt 

And thanks to other contributors also :) 


## Donation
Considering the hours spent on developing this project and you might have used it on production please show some small apperication to author by donations. Doner's name will be written on this repo as a mark of appreciation. I do accept cards payment, paypal but I am not writing it here. If you like to donate kindly message me at `bloggervista@gmail.com` .
If you are bitcoin user you can send me donations at blockchain `1NJb7cqYqP3nbR5WDjdaVvaduXfg8KEsHG` or `ether` at `0xA583445Acf22604219037D31f2D163B877DAad08`

## How can I thank you?
Why not star the github repo?

Don't forget me to ask any questions via [facebook](https://facebook.com/iamshirshak)! or issue tab?

Thank you DHH and everybody at opensource.

Shirshak Bajgain
