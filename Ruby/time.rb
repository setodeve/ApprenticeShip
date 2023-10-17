def time(s)
  $h = s/3600
  $m = s/60%60
  $s = s%60
  puts "#{$h.floor}:#{$m.floor}:#{$s}"
end

time(4210)
time(3600)
time(86400)