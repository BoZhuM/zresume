#coding: utf-8
require 'erb'
module Zresume
    module Printable
        def output
            "My name is #{name}, #{age} years old, #{gender}"
        end
        def to_file(format = 'yaml')
            File.open('zhubo.yml', 'w') do |out|
                out.puts self.to_yaml
            end
        end
        def file_exit?(format = 'yaml')
            Dir["#{name}\.*"]
        end

        def to_html
            self.instance_eval do
                template = ERB.new <<-EOF
                    <html>
                        <head>#{name}</head>
                        <body>
                            \##{to_hash}
                        </body>
                    </html>
                EOF
            end
        end
        def to_json
            self.instance_variables.each do |k|
                s= <<-EOF
                   #{k.to_s.delete("@")}:#{instance_variable_get k}
                EOF
                p s
            end
        end
    end
end