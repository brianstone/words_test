#ask for file from user
puts "Hello. Please enter the file to read: "
txt = gets.chomp
a = []
#arr = []
txt_file = File.open(txt) do |f|
	f.each_line do |line|
		if line.chomp.length >= 4
			a << line.chomp
		# else
		# 	arr << line.chomp
		end
	end
	puts "There are #{a.count} words all together"
	puts "#{a[40]} is #{a[40].length} characters."

	# puts "There are #{a.count} words with 4 or more characters"
	# puts "There are #{arr.count} words less than 4 characters"
	# puts arr

end