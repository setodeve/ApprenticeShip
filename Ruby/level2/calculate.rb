def calculate(num1,num2,operator)
  if (num1== 0 or num2 == 0)
    raise "ゼロによる割り算は許可されていません"
  end

  if (num1.integer? or num2.integer?)
    raise "num1、 num2 には整数を入力してください" 
  end

  if(operator=="+")
    return num1+num2
  elsif(operator=="-")
    return num1-num2
  elsif(operator=="*")
    return num1*num2
  elsif(operator=="/")
    return num1/num2
  else
    raise "演算子には  +、-、*、/ のいずれかを使用してください" 
  end
end

puts "1番目の整数を入力してください:"
num1 = gets.chomp.to_f

puts "2番目の整数を入力してください:"
num2 = gets.chomp.to_f

puts "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

result = calculate(num1, num2, operator)
puts result
