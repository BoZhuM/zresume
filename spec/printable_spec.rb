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
          pending
        end
        it ".to_file(yaml)" do
          pending
        end
    end
end