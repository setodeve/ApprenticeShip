def sum_1_100(x,y)
  $sum = 0
  while x<=y do
    $sum += x
    x += 1
  end
  puts $sum
end
sum_1_100(10,80)