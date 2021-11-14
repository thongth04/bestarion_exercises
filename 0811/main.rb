require "byebug"
# Nhập vào một mảng gồm n (n≤ 99) số tự nhiên từ bàn phím
# (quá trình nhập sẽ dừng khi người sử dụng nhập vào giá trị -1)
# sau đó hiển thị mảng vừa nhập và giá trị nhỏ nhất của mảng ra màn hình.


myArray = [] # trong ruby mình kg đặt tên biến là myArray nhé e, mà là my_array, biến chứa nhiều phần tử nên là số nhiều
puts "Ban hay nhap gia tri cac phan tu cua mang! (Nhap -1 de ket thuc nhap)"
i = 0; # cuối câu kg cần dùng dấu ;, b
while myArray.length < 99
  puts "Nhap gia tri phan tu thu #{i+1}:"
  print "a[#{i}] = "
  
  user_input = gets.chomp
  # byebug
  loop do
    if (!user_input.include?(".") && user_input.to_i > 0) || user_input == "0" || user_input == "-1" 
      # user_input == "0" || user_input == "-1" e có thể viết là ["0", "1"].include?(user_input)
      break
    else
      puts "Gia tri phan tu phai la so tu nhien. Moi ban nhap lai:"
      print "a[#{i}] = "
      user_input = gets.chomp
    end
  end
  
  user_input = user_input.to_i
  if user_input == -1 # e có thể đặt -1 là hằng số để dễ đọc nhé. vd: STOP_SIGNAL = -1
    break    
  else
    myArray << user_input
    i += 1
  end
end
ơ]
min = myArray[0]
myArray.each do |item|
  min = item if item < min 
end
puts "Gia tri nho nhat cua mang la: #{min}"

# Chương trình của e viết gọn gàng, biết sử dụng .include? là một điểm cộng 
# Tuy nhiên thì vẫn có bug khi user input kg đúng 
# VD:
# Ban hay nhap gia tri cac phan tu cua mang! (Nhap -1 de ket thuc nhap)
# Nhap gia tri phan tu thu 1:
# a[0] = 9 abc        
# Nhap gia tri phan tu thu 2:
# a[1] = 5 + 1
# Nhap gia tri phan tu thu 3:
# a[2] = -1
# Mang cua ban la: myArray = [9, 5]
# Gia tri nho nhat cua mang la: 5

