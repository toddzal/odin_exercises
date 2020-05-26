# def beer(num)
#     if num == 0
#         puts "No more bottles of beer on the wall"
#     elsif num == 1
#         puts "1 bottle of beer on the wall"
#         beer(num -1)
#     else
#         puts "#{num} bottles of beer on the wall"
#         beer(num -1)
#     end
# end

# beer(7)

def fib(num)

    if num < 1
        puts "You must enter a positive number greater than 0"
    elsif num == 1 || num == 2
        return 1
    else 
        return fib(num - 1) + fib(num - 2)
    end
end

puts fib(8)
