#!/usr/bin/ruby
require 'pp'

table = {}
ary = [""]
(1..289).each{|n|
  filename = sprintf("%03d.bmp",n)
  open(filename) {|f|
    data = f.read
    t = data[data.size-5, 5]
    idx = t[4] * 256 + t[3]
    table[idx] = "#{sprintf("%03d",n)}.bmp"
    ary[n] = [filename, idx]
  }
}

# start index
s = 234

ans = []
loop do
  a = ary[s]
  ans << a[0]
  s = a[1]
  break if s == 0
end

ans.each_with_index {|f, i|
  x = i % 17
  y = i / 17
  puts "setimg(\"#{f}\", #{x}, #{y});"
}

