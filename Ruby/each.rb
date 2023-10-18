def print_names(names)
  names.each.with_index(1) do |n, i|
    puts "#{i}. #{n}"
  end
end

print_names(['上田', '田仲', '堀田'])
