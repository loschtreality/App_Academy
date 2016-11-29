class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    output = 1
    return output if self.empty?
    self.each_with_index do |element, idx|
      unless element.is_a?(Fixnum)
        output += element.hash * idx
      else
        output *= (element + idx)
      end
    end

    output
  end
end

class String
  def hash
    output = 1
    self.each_char { |chr| output += output ^ chr.ord }
    output
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    output = 1
    return output if self.empty?

    self.each do |k,v|
      unless v.is_a?(Array) || v.is_a?(Hash)
        output += k.to_s.ord * v.hash
      else
        output *= k.to_s.ord + value
      end
    end

    output
  end


end
