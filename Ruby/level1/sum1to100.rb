def sum_1_100
  $i=1
  $sum = 0
  while $i<=100 do
    $sum += $i
    $i += 1
  end
  puts $sum
end
sum_1_100()