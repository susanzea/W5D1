require "byebug"

class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)

  end

  def insert(num)
    if num.between?(0, @max)
      @store[num] = true
      return true    
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

   def include?(num)
    rem = num % @num_buckets
    @store[rem].include?(num)
  end

  def insert(num)
    rem = num % @num_buckets
    unless @store[rem].include?(num)
      @store[rem] << num
      return true
    else
      return false
    end
  end

  def remove(num)
    rem = num % @num_buckets
    @store[rem].delete(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    rem = num % num_buckets
    unless @store[rem].include?(num)
      @store[rem] << num
      @count += 1
      resize! if count > @store.length
      return true
    else
      return false
    end
  end

  def remove(num)
    rem = num % num_buckets
    if @store[rem].include?(num)
      @store[rem].delete(num)
      @count -= 1
      return true
    else
      return false
    end

  end

  def include?(num)
    rem = num % num_buckets
    @store[rem].include?(num)
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
end
