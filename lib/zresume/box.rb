module Zresume
    class Box < Array
        def method_missing(m, *a)
            t = select {|a| a.title.to_s == m.to_s }
            raise Exception, "There is no Item named `#{m}`." if t.empty?
            return t[0] if t.length == 1
        end
    end
end