# Dronestream

Library to access the Dronestream API

## Installation

Add this line to your application's Gemfile:

    gem 'dronestream'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dronestream

## Usage

First, you need a Client

> require 'dronestream'
> client = Dronestream::Client.new 

You can also call Dronestream.new:

> require 'dronestream'
> client = Dronestream.new 

If you just want all of the strikes:
> strikes = client.all

It is an array of Strike instances.

In order to find a specific strike, you can pass in the number.

> strike = client.find 1

This will return a single strike (or nil, if nothing is found). You can also pass in an attribute name and value, and it will return a list containing all strikes matching that parameter.

> x = c.find :bureau_id => 'YEM001' # Returns an array of 1 element
> six_deaths = c.find :deaths => 6

There are some find_by_X methods. They are based on the attribute names of the Strike class. (If you're familiar with Rails, think model find methods). The following are equale to the examples above:

> x = c.find_by_bureau_id 'YEM001'
> six_deaths = c.find_by_deaths 6

One think to keep in mind. All these finders return an array *except* find_by_number. This returns a single instance, just as Client.find does.


## Contributing

I'm open to all suggestions.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
