MyanBank Currency Exchange Rate API
===================================

This is a small abstract code from one of our projects.
Basically, it scraps the websites, subtract the necessary values, convert to hash and return as JSON.
**Warning** : As it's a scrapper, the results may vary as the layout of the website varies. Please open an issue if you notice it.

It currently supports the following banks.
* [AGD Bank][1]
* [CB Bank][2]
* [Kanbawza Bank][3]

Quick Start Guide
-----------------
It can be run as a command line tool or a web application.

```bash
$ git clone https://github.com/Zwenexsys/myanbanks_currency_api
$ cd myanbanks_currency_api
$ bundle install
```

Running Command line script
---------------------------
```bash
$ ruby cmd.rb <AGB (or) CB (or) KBZ>
```

Running web app
---------------
```bash
$ ruby app.rb
```
The web app should be running at `http://localhost:4567`.
It accepts bank codes as `GET` params. (agd (or) cb (or) kbz)


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

License
-------
GNU GENERAL PUBLIC LICENSE V2


[1]: http://www.agdbank.com/category/exchange-rate/
[2]: http://www.cbbank.com.mm/exchange_rate.aspx
[3]: http://www.kbzbank.com/en
