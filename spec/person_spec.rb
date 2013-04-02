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
                    url 'example.com'
                    item 'http://www.tevogroup.com/'
                    item 'http://edu.tevogroup.com/'
                    item 'http://www.jndchina.com/'
                end
            end
            z = Kids.new
            z.experience.item[0].company.should == "Shenzhen Goldsan electronic STD"
            z.works.item.should == ['http://www.tevogroup.com/', 'http://edu.tevogroup.com/', 'http://www.jndchina.com/']
            z.works.url.should == 'example.com'
            z.experience.item[0].output.should == "2010-2011, Shenzhen Goldsan electronic STD, Web Master & Programmer"
        end
    end
end
