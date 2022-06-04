arr = [2,5,6,7,13,4,1,44]

puts arr.to_s

print "Array elements with odd indexes:"
arr.each_with_index do |elem, index|
  if (index % 2) == 0
    print " #{elem} "
  end
end

puts

print "Array elements with even indexes:"
arr.each_with_index do |elem, index|
  if (index % 2) != 0
    print " #{elem} "
  end
end
