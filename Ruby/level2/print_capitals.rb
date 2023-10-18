#ハッシュと配列の違い
#ハッシュはキーを自由に設定できる

#ハッシュは複数データを特殊なキーと値を組み合わせたい場合
#配列は複数データを管理したい場合

def print_capitals(capitals)
  capitals.each do |key,value|
    puts "#{key}の首都は#{value}です"
  end
end

print_capitals({ '日本' => '東京', 'アメリカ' => 'ワシントンD.C.' })
