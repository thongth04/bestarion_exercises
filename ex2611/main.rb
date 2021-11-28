require 'byebug'

# Input đầu vào là hai mảng a và b không rỗng, viết hàm check xem 
# mảng b có là mảng con (cùng thứ tự) của a hay không?
# VD: a = [5, 1, 22, 26, 6, -1, 8, 10]
#        b = [1, 6, -1, 10]
# -> output: true
# Note: chỉ sử dụng 1 vòng for hoặc while trong hàm check của mình


def check_order_sub_arrays(my_arrays, sub_arrays)
  compared_arrays = []
  for num in my_arrays
    compared_arrays << num if sub_arrays.include?(num)
  end

  compared_arrays == sub_arrays
end

# CASE: CAC PHAN TU CUA MANG KHONG TRUNG NHAU
a = [5, 1, 22, 26, 6, -1, 8, 10]
b = [1, 6, -1, 10]
puts check_order_sub_arrays(a, b)

# CASE: CAC PHAN TU CUA MANG CO TRUNG NHAU
c = [5, 1, 22, 26, 6, -1, 8, 6, 10, 5]
d = [1, 6, -1, 6, 10, 5]
puts check_order_sub_arrays(c, d)

# NOTE: CHUONG TRINH CHI DUNG TRONG CASE CAC PHAN TU CUA MANG KHONG TRUNG NHAU
