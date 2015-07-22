#I Love DIY


###[Live Demo](http://www.ilovediy.ninja)

I love DIY is a social platform for DIY enthusiasts to share their DIY (Do It Yourself) experiments. It is inspired by my super-handy husband who likes to build things himself. Users can publish posts, upload pictures, make comments, collect posts, and can use an "inbox" to send messages to each other. Of course, they also have the freedom to put somebody's messages into "Trash", or even block some other evil users from messaging them. So it is a fun place for DIY enthusiasts to share experience, learn tips, communicate with each other, and make friends.

Written as a capstone project for *[App Academy](http://www.appacademy.io)* (NYC May 2014 cohort).

###Technical Features

In addition to the standard CRUD features offered by web applications written in Rails, technical highlights include:

####Authentication

Authentication is hand-written from scratch, together with session management. BCrypt is used to safely encrypt passwords and store them in the database. Users are able to log in using Facebook using OmniAuth integration (Later I removed this feature when I used AJAX to implement log in, and I used Javascript to do front-end validations.)

####CSS

All CSS is hand-written from scratch and organized into the appropriate SASS asset files, split into different sections based on which view the code is specific to . This makes for much cleaner, organized CSS. I use CSS3, HTML5, and Javascript generously to create great visual effects.

#### Javascript

Log In and Sign Up are implemented using AJAX requests to RESTful Rails controllers. JQuery is also used to make a light carousel on the home page, creating a smotth transition between images and texts. JQuery also is heavily used on the comments page to create modals.

####Backbone.js

The majority of the front-end of the application is written in Backbone.js, using the appropriate front-end MVC architecture. This is built on top of a RESTful Rails API serving up JSON responses to AJAX requests, making the application significantly faster in terms of UX and keeping the front-end Javascript properly organized.

####Database




