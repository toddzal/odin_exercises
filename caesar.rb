puts "What word would you like to Cipher?"
word = gets.chomp
puts "How many characters to offset?"
offset = gets.chomp.to_i
min = 65
max = 90


def cipher (word, offset)
    collector = []
    if offset <= 0 || offset > 25
        puts "Offset must be a number between 1 and 25."
        return 
    end
    word.bytes.each do |val|
        if (val >= 97 && val <= 122)
            if (val + offset)>122
                collector.push(val + offset - 26)
            else
                collector.push(val + offset)
            end
        elsif (val >= 65 && val <= 90)
            if (val + offset)>90
                collector.push(val + offset - 26)
            else
                collector.push(val + offset)
            end
        else
            collector.push(val)
        end
    end
    puts collector.pack("c*")
end

cipher(word, offset)