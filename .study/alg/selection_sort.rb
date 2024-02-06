def run(numbers)
  numbers.length.times do |i|
    min_idx = i
    (i + 1...numbers.length).each do |x|
      if numbers[min_idx] > numbers[x]
        min_idx = x
      end
    end
    numbers[i], numbers[min_idx] = numbers[min_idx], numbers[i]
  end

  numbers
end

p run([ 2, 5, 1, 8, 7, 3 ])
