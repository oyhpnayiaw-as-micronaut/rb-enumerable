module MyEnumerable
  def all?
    each do |item|
      return false unless yield item
    end
    true
  end

  def any?
    each do |item|
      return true if yield item
    end
    false
  end

  def filter
    result = []
    each do |item|
      result << item if yield item
    end
    result
  end
end

class MyList
  include MyEnumerable

  def initialize(*data)
    @list = Array.new(data)
  end

  def each
    @list.each do |item|
      yield item
    end
  end
end

list = MyList.new(1, 2, 3, 4)

p list.all? {|e| e < 5}
p list.all? {|e| e > 5}

p list.any? {|e| e == 2}
p list.any? {|e| e == 5}

p list.filter {|e| e.even?}
  
