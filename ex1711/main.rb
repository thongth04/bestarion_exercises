require 'byebug'
# Khởi tạo một mảng random gồm n (n≤ 99) số tự nhiên, với n nhập từ bàn phím, các phần tử trong mảng từ 1 đến 9.
# Sau đó hiển thị các dãy con tăng trong mảng. Vd: mảng được khởi tạo ngẫu nhiên là: [6, 8, 2, 5, 3, 6, 1, 2, 7, 1]
# Output: 
#  + mảng con tăng 1: 6, 8
#  + mảng con tăng 2: 2, 5
#  + mảng con tăng 3: 3, 6
#  + mảng con tăng 4: 1, 2, 7
#  + mảng con tăng 5: 1

my_array = []
print "Ban hay nhap so phan tu cua mang: "
n = gets.chomp.to_i
n.times { my_array << rand(1..9) }
print "Mang cua ban la: "
p my_array

my_array[n] = 0
sub_arrays = [] 
sub_array = []
i = 0
temp_min = my_array[0]
while i < n
  sub_array << my_array[i]
  if my_array[i] < my_array[i+1]
    i += 1
    next
  else
    sub_arrays << sub_array
    sub_array = []
    temp_min = my_array[i+1]
  end
  i += 1
end

i = 1
for sub_array in sub_arrays
  print "Mang con tang #{i}: "
  sub_array.each { |num| print "#{num} "}
  print "\n"
  i += 1
end