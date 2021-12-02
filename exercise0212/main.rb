require 'byebug'

# Viết chương trình trong đó có hàm nhận input đầu vào là một mảng không rỗng và các phần tử trong mảng 
# không trùng nhau (có thể bao gồm số âm), và một con số đại diện cho tổng (target_sum).
# Nếu 3 số trong một mảng có tổng bằng với target_sum, in ra mảng với 3 số đó. Nếu không có in ra mảng rỗng
# Lưu ý: chỉ sử dụng tối đa 2 vòng lặp for hoặc while lồng nhau, có thể sử dụng nhiều vòng for không lồng nhau. 
# Cần in ra các mảng thỏa tiêu chí tìm thấy
# Vd: input là mảng 
#   numbers = [12, 3, 1, 2, -6, 5, -8, 6]
#   target_sum = 0
# => output sẽ là [[-8, 2, 6], [-8, 3, 5], [-6, 1, 5]]


numbers = [12, 3, 1, 2, -6, 5, -8, 6]
target_sum = 0

# Tim tat ca mang con co 3 phan tu cua numbers
sub_arrays = numbers.combination(3).to_a

res = []
for item in sub_arrays
  reducer = item.reduce { |sum, number| sum + number }
  res << item if reducer == target_sum
end
p res
