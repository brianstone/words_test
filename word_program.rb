# def import_txt(file_name)
# 	File.open("dictionary.txt") do |f|
# 		f.each_line do |line|
# 			@words << line
# 		end
# 	end
# end

puts "Hello. Please enter the file to read: "
txt = gets.chomp
a = []
txt_file = File.open(txt) do |f|
	f.each_line do |line|
		a << line
	end
end
