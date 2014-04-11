MyanBank Currency Exchange Rate API
===================================

This is a small abstract code from one of our projects.
Basically, it scraps the websites, subtract the necessary values, convert to hash and return as JSON.

It can be run as a command line tool or a web application.

###Quick Start Guide
```bash
$ git clone https://github.com/Zwenexsys/myanbanks_currency_api
$ cd myanbanks_currency_api
$ bundle install
```

#### Running Command line script
```bash
$ ruby cmd.rb <AGB (or) CB (or) KBZ>
```

#### Running web app
```bash
$ ruby app.rb
```
The web app should be running at `http://localhost:4567`.
It accepts bank codes as `GET` params. (agd (or) cb (or) kbz)


###License
GNU GENERAL PUBLIC LICENSE V2
