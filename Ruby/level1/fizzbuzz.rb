def fizz_buzz
  $i = 1
  $s = ""
  # 1から100までfor文
  while $i<=100 do
    # 3かつ5の倍数の時
    if $i%3==0 and $i%5==0
      $s += "FizzBuzz"
    # 3の倍数の時
    elsif $i%3==0
      $s += "Fizz"
    # 5の倍数の時
    elsif $i%5==0
      $s += "Buzz"
    # そのほかの時
    else
      $s += "#{$i}"
    end
    # ,追加
    $s += ","
    # カウントアップ
    $i+=1
  end
  # 最後の一文字を削除して表示
  puts $s.chop
end
fizz_buzz()