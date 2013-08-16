module DroneApi
  class Client
    def initialize
      @debug = false
    end

    def debug?
      @debug
    end

    def set_debug(flag)
      @debug = flag
    end

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
      if (m = meth.to_s.match(/^find_(.+)_btwn/))
        new_method = "def #{meth}(low, high); find_between :#{m[1]}, low, high; end"
      elsif (m = meth.to_s.match /find_(.+?)_([l|g]te?)/)
        op = m[2].match(/^gt/).nil? ? '<' : '>'
        op = "#{op}=" if m[2].match(/\=$/)

        new_method = "def #{meth}(val); find_cmp :#{m[1]}, val, '#{op}'; end"
      elsif (m = meth.to_s.match(/^find_by_(.+)/))
        new_method = "def #{meth}(val); find_cmp :#{m[1]}, val, '=='; end"
        args = [args.first]
      end

      if m
        key = m[1].to_sym
        if Strike.new.respond_to? key
          add_finder(meth.to_s, new_method, *args)
        else
          super
        end
      else
        super
      end
    end

    protected

    def add_finder(meth, code, *args)
      instance_eval code
      debug "meth: #{meth}" 
      debug "code: #{code}" 
      debug "args: #{args}" 
      send meth, *args
    end

    def find_equals(key, value)
      key = key.to_sym
      value = value.first if value.is_a? Array
      value = value.to_s unless value.nil?
      result = all.select do |s| 
        test = s.send(key)
        test = test.to_s unless test.nil?
        value == test
      end

      result = result.first if key == :number and not result.nil?
      return result

    end

    def find_cmp(key, value, op)
      key = key.to_sym
      value = value.first if value.is_a? Array
      result = all.select do |s| 
        test = s.send(key)
        eval "value #{op} test"
      end

      result = result.first if key == :number and not result.nil?
      return result

    end

    def find_between(key, low, high)
      # low and high have to 
      #   1) Be either Integer, Float, date or DateTime and
      #   2) Be the same class
      if low.class != high.class
        raise DroneApi::Error.new "Expected objects of same class; received one #{low.class} and one #{high.class}"
      end

      if [Date, DateTime, Integer, Float].select {|c| low.is_a? c }.empty?
        raise DroneApi::Error.new "Receieved #{low.class}. Expected Date, DateTime, Integer, or Float."
      end

      key = key.to_sym
      all.select do |s|
        test = s.send(key)
        test >= low and test <= high
      end
    end

    def debug(msg)
      puts msg if debug?
    end

  end
end