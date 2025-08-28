module Enumerable
  # Your code goes here
  def my_select
    sorted_array=[]
    self.my_each do |elem|
      sorted_array << elem if yield(elem)
    end
    return sorted_array
  end

  def my_all?
    sorted_array=[]
    self.my_each do |elem|
      return false unless yield(elem)
    end
    return true
  end

  def my_any?
    sorted_array=[]
    self.my_each do |elem|
      return true if yield(elem)
    end
    return false
  end

  def my_none?
    sorted_array=[]
    self.my_each do |elem|
      return false if yield(elem)
    end
    return true
  end

  def my_count
    return self.length unless block_given?
    
    return self.my_select { |elem| yield(elem) }.length
    # return new_array.length
  end
  
  def my_map
    return_array=[]
    self.my_each do |elem|
      return_array << yield(elem)
    end
    return return_array
  end

  def my_inject(initial_value)
    value = initial_value
    self.each do |elem|
      value = yield(value, elem)
    end
    return value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    # Complete code
    self.each do |elem|
      yield(elem)
    end
  end
  
  def my_each_with_index
    index=0
    self.my_each do |elem|
      yield(elem, index)
      index+=1
    end
  end
end
