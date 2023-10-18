#シンボルとは何か
#シンボルは変更不可能（Immutable）なオブジェクト
#シンボルは同値の場合は必ず一致する
#比較処理の場合文字列に比べて処理が早い

#文字列と何が違うのか
#変更可能（mmutable）なオブジェクト

#シンボルがよく使われるのはどのような用途か
#文字列の代わりにシンボルを利用することてコードの可読性、処理を早くすることが可能
def convert_currency(amount, source_currency, target_currency, conversion_rates)
  puts amount*conversion_rates[target_currency].to_i
end

conversion_rates = {
  usd: 1.0,
  jpy: 110.0,
  eur: 0.8
}

convert_currency(100, :usd, :jpy, conversion_rates)