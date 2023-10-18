def xor(x,y)
  if ((x==true and y==true) or (x==false and y==false))
    puts "false"
  elsif(x==true or y==true)
    puts "true"
  end
end

xor(true, true)
xor(true, false)
xor(false, true)
xor(false, false)