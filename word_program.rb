#clear screen for clarity
system "clear"

#ask for file from user
puts "Hello. Please enter the file to read: "
txt = gets.chomp

#create files with authorized write status to be populated
words_file = File.open('words', 'w')
sequences_file = File.open('sequences', 'w')

#initialize a blank array for words
a = []

#open the user given text file and add each line to the initialized array 'a'
txt_file = File.open(txt) do |f|
	f.each_line do |line|
		if line.chomp.length >= 4
			a << line.chomp
		end
	end

	#remove 4 letter sequences and place them into a hash
	sequences = Hash.new { |hash, key| hash[key] = [] }

	a.each do |word|
		n = word.length - 3

		n.times do |i|
			sequences[word[i..(i+3)]] << word
		end
	end

	#iterate over sequences and place sequences and words in the correct files.
	sequences.each do |key, value|
		if value.uniq.size == 1
			words_file.puts value.uniq.first
			sequences_file.puts key
		end
	end
	words_file.close
	sequences_file.close

	#alert user of program completion.
	puts "Done! Please refer to the created 'sequences' and 'words' files for results."

end