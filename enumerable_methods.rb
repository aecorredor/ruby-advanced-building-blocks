module Enumerable
  def my_each
    index = 0
    result = []
    while index < self.length
      result[index] = yield(self[index])
      index += 1
    end
    self
  end

  def my_each_with_index
    index = 0
    result = []
    while index < self.length
      result[index] = yield(self[index], index)
      index += 1
    end
    self
  end

  def my_select
    result = []
    self.my_each do |element|
      result << element if yield(element)
    end
    result
  end

  def my_all?
    self.my_each { |element| return false unless element } unless block_given?
    self.my_each { |element| return false unless yield(element) } if block_given?
    true
  end

  def my_any?
    self.my_each { |element| return true if element } unless block_given?
    self.my_each { |element| return true if yield(element) } if block_given?
    false
  end

  def my_none?
    self.my_each { |element| return false if element } unless block_given?
    self.my_each { |element| return false if yield(element) } if block_given?
    true
  end

  def my_count(item = nil)
    count = 0
    self.my_each { |element| count += 1 if yield(element) } if block_given?
    self.my_each { |element| count += 1 if element == item } if item
    self.my_each { count += 1 } unless block_given? || item
    count
  end

  def my_map
    result = []
    self.my_each_with_index { |element, index| result[index] = yield(element) }
    result
  end

  def my_inject(initial_value = nil)
    running_total = self[0] unless initial_value
    running_total = initial_value unless initial_value.nil?
    self.my_each_with_index do |element, index|
      next if index == 0 && initial_value.nil?
      running_total = yield(running_total, element)
    end
    running_total
  end
end

def multiply_els(array)
  array.my_inject { |total, number| total * number }
end
