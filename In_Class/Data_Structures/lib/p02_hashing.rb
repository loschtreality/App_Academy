class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    xOR = 0
    self.each_with_index do |el,idx|
      if el.is_a?(Array)
      xOR += xOR ^ (el.hash + idx)
      else
      xOR += xOR ^ (el + idx)
      end
    end
    xOR
  end
end

class String
  def hash
    xOR = 0
    self.each_char do |ch|
      xOR += xOR ^ ch.ord
    end
    xOR
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_array = self.map do |k,v|
      [k,v]
    end.sort {|a,b| a[0] <=> b[0] }

    xOR = 0
    hash_array.each_with_index do |el, idx|
      xOR += xOR ^ el.last.hash
    end
    xOR
  end

end
