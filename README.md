# CDDS Gem

A Ruby interface for searching disqualified company directors and senior managers

## About the Companies Office

The New Zealand Companies Office has an API which can be accessed through registration at: [https://api.business.govt.nz/api/](https://api.business.govt.nz/api/)

Registration is required in order to obtain unique access keys to use the API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cdds'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cdds

You will also need to set the following ENV variables, in order to access the API. These can be gound on the business.govt.nz website under your login.

    $ MBIE_ID=

    $ MBIE_SECRET=


## Usage

One function is exposed, as per below.

### Search for a disqualified person

	$ CDDS::DisqualifiedPersons.search(name)
  * where name is the name of the person you wish to search for on the register

## Queries

> NB: This Gem is not developed or maintained by the New Zealand Companies Office in any way, shape, or form.

Please don't hesitate to get in touch if you have any queries and I'll try and point you in the right direction!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/td512/cdds.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
