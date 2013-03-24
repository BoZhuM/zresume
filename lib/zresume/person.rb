#inspired by _why: http://mislav.uniqpath.com/poignant-guide/dwemthy/
require 'yaml'
require 'zresume/printable'
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
                            @tmpbox = []
                            v =  self.instance_eval(&v) if v.respond_to? :lambda?
                            instance_variable_set("@#{k}", v)
                            remove_instance_variable(:@tmpbox)
                            self.class.info[k] = v
                        end
                    end
                end#initialize, add the instance variables
            end
        end
        
        def item arg='', &bl
            tmp = Zresume::List.new
            tmp.title = arg
            tmp.instance_eval &bl if block_given?
            @tmpbox << tmp
        end

        def to_hash
            self.class.info
        end

        # def _meta
        #     @meta ||= {}
        # end

        # def method_missing(m, *arg, &bloc)
        #      unless arg.empty?
        # end
    end
end