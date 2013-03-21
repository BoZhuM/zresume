#coding: utf-8
require 'zresume'
describe Zresume::Printable   do
    before(:all) do
        class Zhubo
            include Zresume::Person
            info(:name, :age, :gender, :experience, :works)
            name 'ZhuBo'
            age 27
            gender 'male'
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
        end
        @zhubo = Zhubo.new
    end
    describe "generate resume" do
        it ".print" do
            # p @zhubo.to_json
            @zhubo.output.should == "My name is ZhuBo, 27 years old, male"
        end
        it ".to_file(yaml)" do
            @zhubo.to_file
        end
    end
end