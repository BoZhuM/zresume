#inspired by _why: http://mislav.uniqpath.com/poignant-guide/dwemthy/
require 'zresume/list'
module Zresume
    module Person
        include Zresume::Printable
        def self.included(base)
            base.extend(Core)
        end

        module Core
            def metaclass
                class << self
                    self
                end
            end#get a metaclass

            def info *attrs
                return @info if attrs.empty?

                attr_reader *attrs

                attrs.each do |key|
                    metaclass.instance_eval do
                        define_method key do |val=nil, &block|
                            @info ||= {}
                            val = block if !val and block
                            @info[key] = val
                        end
                    end
                end#set class method

                class_eval do
                    define_method(:initialize) do
                        self.class.info.each do |k, v|
                            if v.respond_to? :lambda?
                                s =  Zresume::List[:title, k]
                                s.instance_eval &v
                                v = s
                            end
                            instance_variable_set("@#{k}", v)
                            self.class.info[k] = v
                        end
                    end
                end#initialize, add the instance variables
            end
        end

        def to_hash
            self.class.info
        end
    end
end