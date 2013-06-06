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

> require 'dronestream'
 => true 
> d = Dronestream.all.first
 => #<Dronestream::Strike:0x992ee48 @id="51a65578e0932c0e1eb4199f", @number=1, @country="Yemen", @date="2002-11-03T00:00:00.000Z", @town="", @location="Marib Province", @deaths=6, @deaths_min=6, @deaths_max=6, @civilians=0, @injuries=0, @children=0, @tweet_id="278544689483890688", @bureau_id="YEM001", @summary_short="In the first known US targeted assassination using a drone, a CIA Predator struck a car killing six al Qaeda suspects.", @link="http://www.thebureauinvestigates.com/2012/03/29/yemen-reported-us-covert-actions-since-2001/", @target="", @lat="15.47467", @lon="45.322755", @articles=[], @names=["Qa’id Salim Sinan al-Harithi, Abu Ahmad al-Hijazi, Salih Hussain Ali al-Nunu, Awsan Ahmad al-Tarihi, Munir Ahmad Abdallah al-Sauda, Adil Nasir al-Sauda’"]>

## Contributing

This is very much a work in progress. I need to implement searching, plus the ability to pull up a specific strike by ID. Additionally, being able to select, for example, strikes by a window would be nifty.

I'm certainly open to other suggestions as well.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
