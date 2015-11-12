#ask for file from user
puts "Hello. Please enter the file to read: "
txt = gets.chomp
#initialize a blank array for words
a = []
#arr = []
#open the user given text file and add each line to the initialized array
txt_file = File.open(txt) do |f|
	f.each_line do |line|
		if line.chomp.length >= 4
			a << line.chomp
		# else
		# 	arr << line.chomp
		end
	end
	puts "There are #{a.count} words all together"
	# puts "#{a[40]} is #{a[40].length} characters."

	# puts "There are #{a.count} words with 4 or more characters"
	# puts "There are #{arr.count} words less than 4 characters"
	# puts arr

	#remove 4 letter sequences and place them into a hash
	sequences = Hash.new { |hash, key| hash[key] = [] }

	a.each do |word|
		n = word.length - 3

		n.times do |i|
			sequences[word[i..(i+3)]] << word
		end
	end


	#puts sequences

	#iterate over hash and place key in 'sequences' file and value in 'words' file


end