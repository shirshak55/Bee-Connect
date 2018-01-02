# Bee Connect

[![Build Status](https://travis-ci.org/bloggervista/Bee-Connect.svg?branch=master)](https://travis-ci.org/bloggervista/Bee-Connect) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![StyleCI](https://styleci.io/repos/107520275/shield?style=plastic)](https://styleci.io/repos/107520275/shield?style=plastic) [![Patreon donate button](https://img.shields.io/badge/patreon-donate-yellow.svg)](https://patreon.com/shirshak "Donate to this project using Patreon")

An advance rails social netowrking system. Think like its is mini facebook with live chat support. Features like  group , group moderation, group chat, global chat, profile update, post, comments, favorites etc..

# Future of this project
* Using webpack and use react js
* Fully documentation for every parts
* Social Login Integration wiht devise
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

> Please don't abuse this project by adding this to marketplace like codecanyon. Actually that really sucks :(

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

# Contributors
Thanks to following kind people who have significant contribution on this project.

1. Henrique Panham Junqueira Villela (@henriquepjv)
2. Vijay Raghavan Aravamudhan (@vraravam)
3. Nenad Miloradovic (@nenadmil)
4. Sebastian Jimenez (@sebasjimenez10)

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

* For windows user you can install imagemagick and add to path and also remember to install redis server on windows. And for database rename .env.example to .env and adjust that file. For ubuntu LTS you can follow the guide.

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
```shell
$ bin/rake
```

* To look at the coverage results:
```shell
$ bin/bundle exec rake brakeman:run && open brakeman-report.html
$ bin/bundle exec metric_fu #--no-open
$ bin/bundle exec rake && open coverage/index.html
```

* Before committing code into the repository, please ensure that the tests all run successfully, and also that the following commands do not error out (the CI process will run these and cause build failures if you forget to do so)
```shell
$ bin/bundle exec rake bundler:audit
```

### Tips
If you are windows user we recommend you to use Cloud9 online IDE or use rails installer.

## Contribution
Feel free to contribute and we will write the name of contributors on this readme file as a appericaiton. We are very happy to merge your PR and give you full credit

## Support
I will always support this project . And this project will not support older version of rails. It will support latest and LTS version of rails.

## Security
If you discover any security related issue, please email `bloggervista@gmail.com` . All security issues will be addressed properly.

## Donation
Considering the hours spent on developing this project and you might have used it on production please show some small apperication to author by donations. Doner's name will be written on this repo as a mark of appreciation. I do accept cards payment, paypal but I am not writing it here. If you like to donate kindly ping me at `bloggervista@gmail.com` .
If you are bitcoin user you can send me donations at blockchain `1NJb7cqYqP3nbR5WDjdaVvaduXfg8KEsHG` or `ether` at `0xA583445Acf22604219037D31f2D163B877DAad08`

## How can I thank you?
Why not star the github repo or make small donations?

Don't forget me to ask any questions via [facebook](https://facebook.com/iamshirshak)!

Thanks!

Shirshak Bajgain
