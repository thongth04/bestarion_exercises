require 'byebug'
# Viết chương trình để hiển thị chi tiết thông tin, tuổi và lương của nhân viên.
# Chương trình của bạn sẽ nhắc người dùng nhập số thứ tự nhân viên, id, tên, năm sinh, chức danh,
# lương 1 ngày, ngày làm viêc và hiển thị kết quả. (Lương = lương 1 ngày x ngày làm)

class Staff
  @@staffs_count = 0
  attr_reader :id, :name, :position
  def initialize(staff_info)
    @index = staff_info[:index]
    @id = staff_info[:id]
    @name = staff_info[:name]
    @year_of_birth = staff_info[:year_of_birth]
    @position = staff_info[:position]
    @salary_per_day = staff_info[:salary_per_day]
    @workdays = staff_info[:workdays]

    @@staffs_count += 1
  end

  def self.count
    @@staffs_count
  end

  def staff_age
    Time.now.year - @year_of_birth
  end

  def show_staff_info
    puts "STT: #{@index} | Ho ten: #{@name} | Tuoi: #{self.staff_age} | Chuc vu: #{@position} | Luong: #{self.salary}"
  end

  private
  def salary
    @workdays * @salary_per_day
  end
end

def input_staff_info
  info = Hash.new
  puts "----NHAP THONG TIN NHAN VIEN----"
  print "So thu tu: "
  info[:index] = gets.chomp
  print "ID nhan vien: "
  info[:id] = gets.chomp
  print "Ho ten: "
  info[:name] = gets.chomp
  print "Nam sinh: "
  info[:year_of_birth] = gets.chomp.to_i
  print "Chuc danh: "
  info[:position] = gets.chomp
  print "Luong mot ngay cong: "
  info[:salary_per_day] = gets.chomp.to_i
  print "So ngay cong: "
  info[:workdays] = gets.chomp.to_i
  return info
end

staffs = []
loop do
  print "\n"
  puts '''-------- STAFFS MANAGEMENT SYSTEM --------
      * Type 0 to EXIT
      * Type 1 to ADD a staff
      * Type 2 to SHOW info of all staff
      * Type 3 to SHOW info of a staff
  '''
  print "Your choice: "
  choice = gets.chomp
  case choice
    when "0" then break
    when "1"
      staff_info = input_staff_info
      newStaff = Staff.new(staff_info)
      staffs << newStaff
    when "2"
      puts "---------- THONG TIN NHAN VIEN ----------"
      staffs.each { |staff| staff.show_staff_info }
      puts "Tong so nhan vien: #{Staff.count}"
    when "3"
      print "Nhap ID nhan vien: "
      staff_id = gets.chomp
      result = staffs.select { |staff| staff.id == staff_id }
      # byebug
      puts "---------- THONG TIN NHAN VIEN ----------"
      result[0] ? result[0].show_staff_info : (puts "404 STAFF NOT FOUND!")
    else
      puts "TYPED ERROR: Wrong Choice. Try Again!"
  end
end