#clear screen for clarity
system "clear"
#ask for file from user
puts "Hello. Please enter the file to read: "
txt = gets.chomp
words_file = File.open('words', 'w')
sequences_file = File.open('sequences', 'w')
#initialize a blank array for words
a = []
arr = []
#open the user given text file and add each line to the initialized array
txt_file = File.open(txt) do |f|
	f.each_line do |line|
		if line.chomp.length >= 4
			a << line.chomp
		else
			arr << line.chomp
		end
	end
	# verifying file was imported with all words.
	puts "There are #{a.count} words all together"

	puts "There are #{a.count} words with 4 or more characters"
	puts "There are #{arr.count} words less than 4 characters"


	#remove 4 letter sequences and place them into a hash
	sequences = Hash.new { |hash, key| hash[key] = [] }

	a.each do |word|
		n = word.length - 3

		n.times do |i|
			sequences[word[i..(i+3)]] << word
		end
	end

	puts "There are #{sequences.count} sequences."
	puts sequences
	puts sequences.size
	#iterate over hash and place hash in 'sequences' file and key in 'words' file
	sequences.each do |key, value|
		if value.uniq.size == 1
			puts "#{key}\t#{value.uniq.first}"
			words_file.puts value.uniq.first
			sequences_file.puts key
		end
	end
	words_file.close
	sequences_file.close
	puts "Done! Please refer to the created 'sequences' and 'words' files for results."


end