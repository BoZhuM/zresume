    require 'zresume'
    class YourName
        include Zresume::Person
        info :name, :age, :gender, :experiences, :works, :skills, :working_env, :public_accounts, :gembox
        #register the attributes
        name 'My Name'
        #.name #=> 'My Name'
        age  25
        gender 'male'
        #set the value in the most simplest way. yes? we set key and value just like writting a hash, but we removed the ":" sign.
        works do
           url 'http://www.example.com' do
              description 'From frontend to backend to deploy, Finished by myself.'
           end
           # .works.url #=> 'http://www.example.com'
           url 'http://www.example2.com'
           # .works.url #=> ['http://www.example.com', 'http://www.example2.com']
           url 'http://www.example3.com'
           # .works.url #=> ['http://www.example.com', 'http://www.example2.com', 'http://www.example3.com']
           lastdesign 'http://www.example4.com'
           # .works.lastdesign #=> 'http://www.example4.com'
           github 'https://github.com/xxx1' do
              desc 'This gem is...' do
                d1 'deep one' do
                  d2 'deep two' do
                    d3 'deep three' do
                      #...
                        dn 'deep n'
                      #...
                    end
                  end
                end
                #you can nest as deep as you like, but it is not a good idea.
                d1 'deep one again' do
                end
              end
           end
           # .works.github #=> {:title => 'https://github.com/xxx1', :desc => 'This gem is...'}
           github 'https://github.com/xxx2'
           # .works.github #=> [{:title => 'https://github.com/xxx1', :desc => 'This gem is...'}, 'https://github.com/xxx2']
           github 'https://github.com/xxx3'

           # The method `url`, `lastdesign` and `github` are not predefined method, 
           # As you write them in the block, you get these methods.
           # If a word that not defined before occured in the block, you get a method that return the signed value.
           # if it was called more than once, you will get an array.
           # if you pass in a block as the last argument, you will get a hash.
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
              #In This Example, `YourName.new.experiences.item[0].do_what` will 
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
            operation_system 'Ubuntu Linux 12.04 LTS'
            vps  'Linode 512'
            webserver 'Nginx'
            editor 'Sublime Text2'
            language 'Ruby 1.9.3'
            framework 'Rails 2.x-3.x'
            database 'Mysql/Mongodb'
            test_frame 'Rspec'
            vcs 'Git'
            editor 'Vim'
        end
        #this will get a hash that respond to the key-value pair writed before.
        #.working_env.editor #=> ['Sublime Text2', 'Vim']

        public_accounts do
            email 'zhuboliu@gmail.com'
            qq 455912224
            git 'https://github.com/suffering'
            phone 11111111111
        end

        gembox %w{devise cancan bootstrap coffeescript rspec mongoid carrierwave simple_form ckeditor kaminari active_admin}
    end