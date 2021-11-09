require "byebug"
# Nhập vào một mảng gồm n (n≤ 99) số tự nhiên từ bàn phím
# (quá trình nhập sẽ dừng khi người sử dụng nhập vào giá trị -1)
# sau đó hiển thị mảng vừa nhập và giá trị nhỏ nhất của mảng ra màn hình.


myArray = []
puts "Ban hay nhap gia tri cac phan tu cua mang! (Nhap -1 de ket thuc nhap)"
i = 0;
while myArray.length < 99
  puts "Nhap gia tri phan tu thu #{i+1}:"
  print "a[#{i}] = "
  
  user_input = gets.chomp
  # byebug
  loop do
    if (!user_input.include?(".") && user_input.to_i > 0) || user_input == "0" || user_input == "-1"
      break
    else
      puts "Gia tri phan tu phai la so tu nhien. Moi ban nhap lai:"
      print "a[#{i}] = "
      user_input = gets.chomp
    end
  end
  
  user_input = user_input.to_i
  if user_input == -1 
    break    
  else
    myArray << user_input
    i += 1
  end
end

puts "Mang cua ban la: myArray = #{myArray}"
min = myArray[0]
myArray.each do |item|
  min = item if item < min 
end
puts "Gia tri nho nhat cua mang la: #{min}"



