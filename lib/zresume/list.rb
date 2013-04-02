module Zresume
    class List < Hash
        def method_missing(m, *a, &bl)
            if !bl
                if m.to_s =~ /=$/
                    self[$`.intern] = a[0]
                else
                    return self[m] if a.empty?
                    self[m] ? self[m]=([self[m]].flatten << a[0]) : self[m] = a[0]
                end
            else
                s =  List[:title, a[0]]
                s.instance_eval &bl
                return self[m] = s if !self[m]
                self[m] = [self[m]].flatten << s
            end
        end
    end
end