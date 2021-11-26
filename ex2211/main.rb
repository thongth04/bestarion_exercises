require 'byebug'
=begin
Viết chương trình trong đó có hàm nhận input đầu vào là một mảng không rỗng và các phần tử trong mảng
không trùng nhau (có thể bao gồm số âm), và một con số đại diện cho tổng (target_sum).
Nếu 2 số trong một mảng có tổng bằng với target_sum, in ra mảng với 2 số đó. Nếu không có in ra mảng rỗng
Lưu ý: chỉ sử dụng 1 vòng lặp for hoặc while. Chỉ cần in ra 1 mảng đầu tiên tìm thấy
Vd: input là mảng 
  numbers = [3, 5, -4, 8, 11, 1, -1, 6]
  target_sum = 10 
=> output sẽ là [11, -1]
=end

numbers = [3, 5, -4, 8, 11, 1, -1, 6]
target_sum = 10
res = []
for num in numbers
  pair_with_num = (numbers - [num]).select{ |x| x + num == target_sum }

  if pair_with_num[0]
    res = [num, pair_with_num[0]]
    break
  else
    next
  end
end
p res

# Code e viết rất gọn, dễ đọc
# pair_of_num =(arrays - [index]).select{|item| item + index == target_sum} -> a thấy e lấy arrays - index -> sẽ thành 1 mãng con mới
# kg chứa index rồi e dùng select (tức duyệt qua từng phần tử trong trong mảng con) để tìm giá trị => về bản chất cũng giống với việc e 
# dùng 2 dòng for nhé. 
