

# 1
# x = (1..255)
# x.each {|num| puts num}

#2
# count = 0
# for i in 1..255
#     count += i
#     puts "New number: #{i} Sum: #{count}"
# end

#3
# def find_max(arr)
#     max = arr[0]
#     arr.each do |num|
#         if num > max
#             max = num
#         end
#     end
#     puts max
# end
    
# find_max [3, 99, 5, 3]

#4
# def find_avg(arr)
#     sum = 0
#     arr.each do |num| sum += num
#     end
#     sum = sum/arr.length
#     puts "Average is #{sum}"
# end

# find_avg [1, 3, 4, 6, 999]

#5
# def odd_nums
#     arr = []
#     for i in (1..255)
#         if i.odd?
#             arr.push(i)
#         end
#     end
#     return arr
# end

# print odd_nums

#6
# def great_than_y(arr, y)
#     count = 0
#     arr.each do |num| if num > y
#         count += 1
#     end
#     end
#     return count
# end

# puts great_than_y [3, 10, 4, 5], 9

#7
# def square_the_value arr
#     return arr.map do |num| num*num
#     end

# end

# print square_the_value [1, 5, 10, -2]

#8
# def eliminate_negative_numbers arr
#     return arr.select do |num| num > 0
#     end
# end

# print eliminate_negative_numbers [1, 3, -2, 0, -300]

#9
# def max_min_avg arr
#     min = arr[0]
#     max = arr[0]
#     avg = 0
#     arr.each do |num| 
#         if num > max
#             max = num
#         end
#         if num < min
#             min = num
#         end
#         avg += num
#     end
#     avg = avg/arr.length
#     return {"avg" => avg, "max" => max, "min" => min} 
# end

# print max_min_avg [1, 5, -1, 2]

#11
# def iterate_array arr
#     arr.each {|num| puts num}
# end

# iterate_array [1,3,5,7,9,13]

#12
# def shifting_array arr
#     return arr.drop(1).push(0)
# end

# x = shifting_array [1,3,5,7,9,13]
# print shifting_array x

#13
# def num_to_string arr
#     return arr.map {|num| num.to_s}
# end

# print num_to_string [1,3,5,7,9,13]