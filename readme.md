visit the website: http://whoisthebestatfifa.herokuapp.com
-----------


### What is it?
---

Who Da Best at Fifa? is an online leaderboard for Fifa players (if you don't know what Fifa is check it out [here](http://en.wikipedia.org/wiki/FIFA_14). It was a simple project I did over the summer of 2014. The endgoal was to get familiar with web design and Ruby on Rails.

For those who know all about it, Fifa creates alot of agruments around one central question: Who really is the best player amongst your friends? Instead of bragging about your skills with no stats to back you up, this website takes care of ranking players instantaneously after each game they play. Simply join a group, add your friends to it and continue playing your favorite game! You finally have a way to really know if you're the best!

---

### Core Features
---

- Users can sign up/sign in/sign out (using Devise)
- Users can navigate through the website with different links, especially the navbar.
- Users can add a Group
- Users can join/view a group
- Users can search for a specific group
- Users can listen to music while naivgating through the pages (classic Fifa tunes played via Spotify)
- Users can add games to a group by specifying the score and the opponent
- Leaderboard is constantly updated through functions I desgined on the model side (ratio, number of wins/losses, goals scored, avg goals per game, games played)
- Users can view the history of all the games in a group

---

### Technologies used
---

- Ruby on Rails app (ruby "2.0.0" and rails "4.0.4") crafted using PostgreSQL, JavaScript, Devise, ActionMailer, and a bit of JQuery
- Testing was done using Capybara and Factory Girl (on the Controller/Views side) and using Shoulda Matchers for model acceptance testing.
- For the design and layout of the website, I used basic Bootstrap, Font-Awsome (for fonts/icons), and Textillate.js for text animation.


---

**Note: The following demos showcase the basic features of the website and how it's used.
        They were recorded as gifs so it might be a bit laggy... [Visit the website!](http://whoisthebestatfifa.herokuapp.com)**
        
### Signing in and Homepage

![Demo](/fifa_var/fifa_1.gif)

### Viewing and Adding game to a group's Leaderboard

![Demo](/fifa_var/fifa_2.gif)

### Back to homepage and creating a group

![Demo](/fifa_var/fifa_3.gif)
