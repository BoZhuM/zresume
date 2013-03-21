class Box < Hash
    def method_missing(m,*a)
        m.to_s =~ /=$/ ? self[$`]=a[0] : a==[] ? self[m.to_s] : super
    end

    def _h; @_h ||= {} end

    alias _s []=

    def set(k, v, o = {})
        _s(j=k.to_s,v)
        _h[j] = v
    end

    def []= (k, v)
        set k, v, v.is_a?(Hash) ? v : {}
    end
end
a = Box.new
a.name = 'suffering'
a.age = 27
# p a.instance_eval{ @_h}
p a