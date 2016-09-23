def windowed_max_range(array,window_size)
  current_max_range = nil

  array.each_with_index do |num, idx|
    range = idx + window_size
    next if range > array.size
    window = array[idx...(range)]
    p window
    range_diff =  window.max - window.min
    current_max_range = range_diff if (current_max_range.nil? || range_diff > current_max_range)
  end

  current_max_range
end


windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
