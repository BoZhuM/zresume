#coding: utf-8
require 'erb'
module Zresume
    module Printable
        def to_file(format = 'yaml')
            # file_name = "#{name}.#{format}"
            # File.open(file_name, 'w') do |out|
            #     out.puts self.to_yaml
            # end
            #pending
        end

        def file_exit?(format = 'yaml')
            #pending
        end

        def to_html
            #pending
        end
        def to_json
            #pending
        end
    end
end