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


bubble_sort_by(["hi","hello","hey" ,"what the fuck is this?"]) do |left,right|
  left.length - right.length 
end

module Enumerable
  def my_each
    counter = 0 
    self.length.times do 
      yield(self[counter])
      counter += 1 
    end
  end 
  
  
  def my_each_with_index
    counter = 0 
    self.length.times do 
      yield(self[counter])
      puts counter
      counter += 1 
    end
  end 
end      