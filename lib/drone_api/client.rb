module Dronestream
  class Client

    # Returns entire list of strikes
    #
    def all
      @cache ||= Request.get('/data')

    end

    # Locates a specific strike by number
    def find(params)
      if params.is_a? Integer
        find_equals(:number, params)
      else
        k,v = params.first
        find_equals k, v
      end
    end

    def method_missing(meth, *args, &block)
      m = meth.to_s.match(/^find_by_(.+)/)
      if m
        key = m[1].to_sym
        if Strike.new.respond_to? key
          instance_eval "def #{meth}(val); find_equals :#{key}, val; end"
          send meth, args.first
        else
          super
        end
      else
        super
      end
    end

    protected

    def find_equals(key, value)
      key = key.to_sym
      value = value.to_s unless value.nil?
      result = all.select do |s| 
        test = s.send(key)
        test = test.to_s unless test.nil?
        value == test
      end

      result = result.first if key == :number and not result.nil?
      return result

    end

  end
end