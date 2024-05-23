# module enumerable for custom Enumerable
module Enumerable
  # Your code goes here
  # my_each_with_index
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
    self
  end

  # select (filters based on condition)
  def my_select
    collection = []
    my_each do |element|
      collection << element if yield(element)
    end
    collection
  end

  # my_any (if any of the elements meets the condition)
  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  # my_all
  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield element
    end
    self
  end
end
