class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)

  end

  def include?(key)
    
  end

  def remove(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end

  def hash_slinging_slasher(key)
    alpha = ("a".."z").to_a + (0..9).to_a
    i_arr = self.split("").map { |ele| alpha.index(ele) }
    i_arr.join("").to_i
  end

end
