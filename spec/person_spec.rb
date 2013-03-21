#coding: utf-8
require 'zresume'
describe Zresume::Person do
    before(:all) do
        class Zhubo
            include Zresume::Person
            info(:name, :age, :gender)
            name 'ZhuBo'
            age 27
            gender 'male'
        end
    end

    describe "inherited form Person" do
        it '.info :k1, :k2,...,:kn' do
            @z = Zhubo.new
            @z.name.should   == 'ZhuBo'
            @z.age.should    == 27
            @z.gender.should == 'male'
        end

        it 'Test the list items added by block' do
            class Kids
                include Zresume::Person
                info(:experience, :works, :delete)
                experience do
                    item 'Web Master & Programmer' do
                        company "Shenzhen Goldsan electronic STD"
                        time '2010-2011'
                        position 'Web Master & Programmer'
                        output [time, company, position].join(', ')
                    end
                    item 'xxx'
                end
                works do
                    item 'http://www.tevogroup.com/'
                    item 'http://edu.tevogroup.com/'
                    item 'http://www.jndchina.com/'
                end
                delete do
                    item 'test'
                end
            end
            z = Kids.new
            p z.to_hash
            p z
            # p z.class.instance_methods(false)
            z.experience[1].title.should == "xxx"
            z.experience[0].position.should == "Web Master & Programmer"
            z.experience[0].time.should == "2010-2011"
            z.experience[0].output.should == "2010-2011, Shenzhen Goldsan electronic STD, Web Master & Programmer"
            z.works[0].title.should      == 'http://www.tevogroup.com/'
            # p z.works[0]. to_s
            z.works[1].title.should      == 'http://edu.tevogroup.com/'
            z.works[2].title.should      == 'http://www.jndchina.com/'
        end
    end
end
