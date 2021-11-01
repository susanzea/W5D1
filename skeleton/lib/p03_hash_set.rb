class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    rem = num % num_buckets
    unless @store[rem].include?(num)
      @store[rem] << num
      @count += 1
      resize! if @count > num_buckets
      return true
    else
      return false
    end
  end

  def include?(key)
    num = key.hash
    rem = num % num_buckets
    @store[rem].include?(num)
  end

  def remove(key)
    num = key.hash
    rem = num % num_buckets
    if @store[rem].include?(num)
      @store[rem].delete(num)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2) { Array.new }
    @store.flatten.each do |ele|
      rem = ele % new_arr.length
      new_arr[rem] << ele
    end
    @store = new_arr
  end

  # def hash_slinging_slasher(key)
  #   alpha = ("a".."z").to_a + ('A'..'Z').to_a + (0..9).to_a
  #   var = key.to_s
  #   i_arr = var.split("").map { |ele| alpha.index(ele) }
  #   i_arr.join("").to_i
  # end

end
