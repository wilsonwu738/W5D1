class MaxIntSet
  attr_reader :store 
  def initialize(max)
    @store = Array.new(max, false)
    
  end

  def insert(num)
    if num < store.length && num >= 0
      store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    if num < store.length && num >= 0
      store[num] = false
    end
  end

  def include?(num)
    return true if store[num] == true
    false
    
  end

  private

  def is_valid?(num)
    # if num < store.length && num >= 0
    #   return true
    # else
    #   return false
    # end 
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = @store.length
  end

  def insert(num)
    # p self[num]
    # p self
    # p num
    if !self[num].include?(num)
      self[num] << num
    end
    
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
