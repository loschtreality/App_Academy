class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |n|
      define_method("#{n}=") { |val| instance_variable_set("@#{n}",val)}

      define_method(n) { instance_variable_get("@#{n}") }
    end
  end



end
