# Bee Connect (Active)

[![Build Status](https://travis-ci.org/bloggervista/Bee-Connect.svg?branch=master)](https://travis-ci.org/bloggervista/Bee-Connect) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![StyleCI](https://styleci.io/repos/107520275/shield?style=plastic)](https://styleci.io/repos/107520275/shield?style=plastic) [![Patreon donate button](https://img.shields.io/badge/patreon-donate-yellow.svg)](https://patreon.com/shirshak "Donate to this project using Patreon")


An advance Ruby on Rails social networking application. It is like mini facebook having features like chat/groups etc. Notable features includes  group , group moderation, group chat, global chat, profile update, post, comments, favorites etc..

This project can be used as an example of creating some complex Ruby on Rails app. 

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
* Latest version of Rails (v5.2.1)
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
We are very open to contribution. Feel free to contribute and we are very happy to merge your PR.

## Security
If you discover any security related issue, please email `shirshak55[at]pm.me` . All security issues will be addressed properly.

## Contributors
This project has been watered by various contribution and I would like to give them a big shoutout. Your contribution shall be remembered forever <3
Lead Contributor: Gary Traffanstedt 

And thanks to other contributors also :)  For more info check contributor tab.

## How can I thank you?
Why not star the github repo?

Don't forget me to ask any questions via [twitter](https://twitter.com/shirshak55)! or issue tab?

I would like to thank DHH for creating Ruby on Rails and all the maintainer of gems making this project possible. This project took like 1 month to build but it wouldn't be possible without the opensource technology.


Thank You!
Shirshak Bajgain
