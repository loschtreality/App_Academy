  original.chars.permutation(original.length).to_a.map { |e| e.join('')}.include?(string)
end

# p first_anagram?("gizmo","sally")
# p first_anagram?("elvis","lives")

# Time complexity O(n!)

def second_anagram?(original, string)
  original = original.split("")
  string = string.split("")

  return false if original.length != string.length

  (original - string == [] && string - original == []) ? true : false
end


# p second_anagram?("gizmo","sally") #false
# p second_anagram?("elvis","lives") #true

def third_anagram?(original, string)
  original.chars.sort == string.chars.sort
end

p third_anagram?("gizmo","sally") #false
p third_anagram?("elvis","lives") #true


def fourth_anagram?(original,string)
  hash = Hash.new(0)

  original.chars.each do |char|
    hash[char] += 1
  end

  string.chars.each do |char|
    hash[char] -= 1 if hash[char] > 0
  end

  hash.values.all? { |_,v| v == 0 }

end

p fourth_anagram?("gizmo","sally") #false
p fourth_anagram?("elvis","lives") #true
