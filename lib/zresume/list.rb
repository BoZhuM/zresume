module Zresume
    class List < Hash
        instance_methods.each do |m|
            undef_method m unless m.to_s =~ /respond_to?|method_missing|^/
        end

        def method_missing(m, *a)
            m.to_s =~ /=$/ ? self[$`] = a[0] : a!= [] ? self[m.to_s] = a[0] : self[m.to_s]
        end
        
        def to_s
            output || title
        end
    end
end