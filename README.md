Brigade Backend
===============

A RESTful backend for a [Code for America](http://www.codeforamerica.org) brigade. Developed in parellel with [Brigade Frontend](https://github.com/codeforboston/brigade_frontend/). More to come.

Installation
------------

1. Rename `config/application.yml.example` to `config/application.yml` and fill in any information (see the [Authentication](#authentication) section for more information on `omniauth`).
2. Modify `config/database.yml` to fill in database connection information.
3. Brigade Backend is a Ruby on Rails app; make sure you've installed Rails, and run the rake tasks for creating a database and migrating the database.


Authentication
--------------

Brigade Backend supports several authentication schemes out of the box: [github](https://github.com/intridea/omniauth-github), [facebook](https://github.com/mkdynamic/omniauth-facebook), [twitter](https://github.com/arunagw/omniauth-twitter), [meetup](https://github.com/tapster/omniauth-meetup), [google-oauth2](https://github.com/zquestz/omniauth-google-oauth2), and Mozilla Persona/[browserid](https://github.com/intridea/omniauth-browserid). To add support, add application keys/secrets to `config/application.yml` Additional options can also be supplied, following the GitHub example supplied in `application.yml`.
