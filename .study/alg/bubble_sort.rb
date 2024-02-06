def run(numbers)
  numbers.length.times do |i|
    (numbers.length - 1 - i).times do |x|
      if numbers[x] > numbers[x + 1]
        numbers[x], numbers[x + 1] = numbers[x + 1], numbers[x]
      end
    end
  end

  numbers
end

p run([ 5, 2, 8, 1, 7, 3 ])
