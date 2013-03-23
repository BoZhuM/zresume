# Zresume

TODO: The Gem is In Building.

## Installation

Add this line to your application's Gemfile:

    gem 'zresume'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zresume

## Syntax
`info *array` register the attributes you need.Once you set the attribute by `info` you can set it's value simply by `attrname value`.

The Value can Be Any Kind of Ruby Object. Mostly you set it a string, number or array.You can pass in a block as the value too. 

In this block, You can use the method `item(arg='string', &block)` to generate a  instance of Zresume::List(a hash like Class, To store more infomations) for you. if you pass in a block to `item`, in this block, you get the freedom to write code just like construct a hash just remove ':' or '=>'. In the following example, You can see it.

## Usage
```ruby
    require 'zresume'
    class YourName
        include Zresume::Person
        info :name, :age, :gender, :experiences, :works, :skills, :working_env, :public_accounts, :gembox
        name 'My Name'
        age  25
        gender 'male'

        works do
           item 'http://www.example.com' do
              description 'From frontend to backend to deploy, Finished by myself.'
           end
           item 'http://www.example2.com'
           item 'http://www.example3.com'
        end

        experiences do
           item '2009-2011' do
              position 'Web Designer'
              do_what 'Web Site interface design. Convert PSD to HTML+CSS+JS.'
              use  %w{Photoshop Html CSS Javascript}
              company 'company name'
              company_url 'http://www.lonwin.net/'
              output <<-EOF
                "#{title}: #{position} in #{company}
                 Using: #{use.join(',')}.
                 And My Job is #{do_what}.
                "
              EOF
              #position, do_what, use, company_url, and output are not predefined methods.#You just write it, and you will get a method named by it, 
              #and set the value for you.right now you can access the value.
              #In This Example, `YourName.new.experiences[0].do_what` will 
              #get the value 'Web Site interface design. Convert PSD to HTML+CSS+JS.' 
           end

           item '2011-2012' do
              company 'company name 2'
              position 'Web Developer'
              works 'works 1, works 2, ..., works N'
              output <<-EOF
                "#{title}: #{position} in #{company}
                Do What:
                #{works}
                "
              EOF
           end
        end

        skills  %w{ruby rails javascript jquery html css}

        working_env do
          system 'Ubuntu Linux 12.04 LTS'
          vps  'Linode 512'
          webserver 'Nginx'
          editor 'Sublime Text2'
          language 'Ruby 1.9.3'
          framework 'Rails 2.x-3.x'
          database 'Mysql/Mongodb'
          test 'Rspec'
          vcs 'Git'
        end

        public_accounts do
          email 'zhuboliu@gmail.com'
          qq 455912224
          git 'https://github.com/suffering'
          phone 11111111111
        end

        gembox %w{devise cancan bootstrap coffeescript rspec mongoid carrierwave simple_form ckeditor kaminari active_admin}
    end
```
TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
