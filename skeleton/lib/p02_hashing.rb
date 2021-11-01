class Integer
  # Integer#hash already implemented for you
end

class Array #Array.hash
  def hash
    return 0 if self.empty?
    output = ""
    self.each { |ele| output += ele.to_s }
    output.to_i
  end
end

class String #String.hash
  def hash
    alpha = ("a".."z").to_a
    i_arr = self.split("").map { |ele| alpha.index(ele) }
    i_arr.join("").to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 0 if self.empty?
    alpha = ("a".."z").to_a + (0..9).to_a
    i_arr = []
    self.each_pair do |k,v|
      i_arr << alpha.index(k.to_s) + alpha.index(v)
    end
    i_arr.sort.join("").to_i
  end

end

