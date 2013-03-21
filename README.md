# Zresume

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'zresume'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zresume

You have two choice, Dark Box or Black Box.
Dark Box:
   open the terminal, run the command:
   `zresume new myclass`
   This command generates a scaffold for you
   myclass
   |--myclass.rb
      #require 'mycalss'
      #class Myclass
      #  include Zresume
      #  #...
      #end
   |--
   |--resumes
   class Myclass
      include Zresume
   end
   By this way, you write the resume by the methods supplied by the gem following the syntx defined in it.

White Box:
   

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
