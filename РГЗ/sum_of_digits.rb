def sum_of_digits(num)
    sum = 0
  
    while num > 0
      sum += num % 10
      num = num/10
    end
  
    return sum
  end
  
  print "Enter a number: "
  num = gets.to_i
  
  print "The sum of the digits in a number = #{sum_of_digits(num)}"
  