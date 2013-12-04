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

Brigade Backend supports several authentication strategies out of the box: [github](https://github.com/intridea/omniauth-github), [facebook](https://github.com/mkdynamic/omniauth-facebook), [twitter](https://github.com/arunagw/omniauth-twitter), [meetup](https://github.com/tapster/omniauth-meetup), [google-oauth2](https://github.com/zquestz/omniauth-google-oauth2), and Mozilla Persona/[browserid](https://github.com/intridea/omniauth-browserid). To add support for one of these strategies, add application keys/secrets to `config/application.yml` Additional options can also be supplied, following the GitHub example supplied in `application.yml`. To add additional strategies from the [list of supported OmniAuth strategies](https://github.com/intridea/omniauth/wiki/List-of-Strategies), add the respective gem for that strategy to the Gemfile in addition to adding it to `application.yml`.
