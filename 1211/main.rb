require 'byebug'
require 'csv'
require 'pg'
# Viết chương trình tạo ra file csv khoảng 500.000 lines với nội dung chứa thông tin user. 
# Sau đó đọc file vừa tạo, rồi import vào database, comment tổng thời gian đọc file + import vào database thành công.

# CREATING CSV FILE
begin_create_file = Time.now
  base_record = {
    name: "Tu Hoang Thong",
    email: "tuhoangthong@gmail.com",
    phone: "0123456789",
    address: "HCM City",
    dob: "2000/01/01",
    profile: "Profile description"
  }
  CSV.open("db.csv", "w") do |csv|
    for i in 1..100
      csv << [
        base_record[:name] + " " +i.to_s,
        base_record[:name].downcase.gsub(' ','') + i.to_s + "@gmail.com",
        base_record[:phone],
        base_record[:address],
        base_record[:dob],
        base_record[:profile]
      ]
    end
  end
end_create_file = Time.now


# READING CSV FILE
begin_read_file = Time.now
  db = CSV.read("db.csv")
  db.each { |record| p record }
end_read_file = Time.now


# IMPORTING DATA FROM CSV FILE TO DATABASE
begin_import_file = Time.now
  con = PG.connect(dbname: 'ex1211', user:'rails')
  for row in db
    con.exec("INSERT INTO USER_INFO(name, email, phone, address, dob, profile) 
              VALUES('#{row[0]}','#{row[1]}','#{row[2]}','#{row[3]}','#{row[4]}','#{row[5]}')")
  end
end_import_file = Time.now


puts "Creating file: #{end_create_file - begin_create_file}s"
puts "Reading file: #{end_read_file - begin_read_file}s"
puts "Importing file: #{end_import_file - begin_import_file}s"
puts "Reading & Importing file: #{end_import_file - begin_read_file}s"