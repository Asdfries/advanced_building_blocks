def bubble_sort(sortable_array)
  sortable_array.length.times do 
    left = 0 
    right = 1 
    
    while right < sortable_array.length do
      if sortable_array[left] > sortable_array[right]
        sortable_array[left], sortable_array[right] = sortable_array[right], sortable_array[left]
        left += 1 
        right += 1
      else
        left += 1 
        right += 1 
      end
    end 
  end
  sortable_array
end


def bubble_sort_by(sortable_array)
  sortable_array.length.times do 
  left = 0 
  right = 1 
  
    while right < sortable_array.length do 
      if (yield(sortable_array[left], sortable_array[right])) > 0 
        sortable_array[left], sortable_array[right] = sortable_array[right], sortable_array[left]
        left += 1 
        right += 1
      else
        left += 1 
        right += 1 
      end 
    end     
  end
  sortable_array
end 

### bubble_sort_by(["hi","hello","hey" ,"what the fuck is this?"]) do |left,right|
  left.length - right.length 
###end

module Enumerable
  def my_each
    i = 0 
    while i < self.size 
      yield(self[i])
      i += 1
    end
  end 
  
  def my_each_with_index
    i = 0 
    while i < self.size 
      yield(self[i], i)
      i += 1 
    end
  end 

  def my_select
    selected = []
    self.my_each do |item|
      if yield(item, self.index(item))
        selected.push(item)
      end 
    end
    selected
  end

  def my_all
    self.my_each do |item|
      if yield(self[item]) == false 
        return false
      else
        return true  
      end 
    end
  end

  def my_any 
    self.my_each do |item|
      if yield(self[item])
        return true
      else 
        return false
      end
    end 
  end 
  
  def my_none
    self.my_each do |item|
      if yield(self[item]) 
        return false
      end 
    end
    true
  end 
  
  def my_count
    selected = []
    self.my_each do |item|
      if yield(item, self.index(item))
        selected.push(item)
      end 
    end
    selected.length
  end
    
  def my_map
    results = []
    self.my_each do |item|
      results.push(yield(item))
    end
    results
  end
end

###[1, 2, 3, 4, 5,6 ,7, 8,9, 10, 10, 10].my_map {|x| x + 10 }
  
  
