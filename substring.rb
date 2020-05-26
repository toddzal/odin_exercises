message = "Todd is rather odd."
dictionary = ["odd", "is", "help","me","bee"]
#dictionary = ["odd"]

def substrings (message, dictionary)
    mess_search = message.split
    counter = 0
    accum = {}
    dictionary.each do |dict|
        mess_search.each do |mess|
            if mess.downcase.include?(dict.downcase) == true
                counter += 1
            end
        end
        if counter > 0
            accum[dict.to_sym] = counter
        end
        counter = 0
    end
    puts accum
end

substrings(message, dictionary)

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)
