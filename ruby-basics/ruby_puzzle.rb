#1
# def array_parse arr
#     sum = 0
#     arr.each {|num| sum += num}
#     puts sum 
#     return arr.reject {|num| num < 10}
# end

# print array_parse [3,5,1,2,7,9,8,13,25,32]

#2
# def array_shuffled arr
#     mixedArr = arr.shuffle {|name| puts name}
#     puts mixedArr
#     return arr.reject {|name| name.length < 5}
# end

# print array_shuffled ['John', 'KB', 'Oliver', 'Cory', 'Matthew', "Christopher"]

#3
# def alphabet_soup arr
#     arr.shuffle!
#     puts arr
#     puts arr.last
#     if "aeiou".include? arr.first
#         puts "First letter a vowel"
#     end
# end

# alphabet_soup ["a", "b", "c", "d", "e"]

#4
# def random_nums
#     newArr = []
#     for i in 1..10
#         newArr.push(rand(55..100))
#     end
#     return newArr
# end

# print random_nums

#5
# def random_nums
#     newArr = []
#     for i in 1..10
#         newArr.push(rand(55..100))
#     end
#     newArr.sort
#     puts newArr.max
#     puts newArr.min
#     return newArr
# end

# print random_nums

#6 7
def random_string
    newArr = []
    for i in 1..10
        newStr = ""
        for i in 1..5
            newStr << (65+rand(26)).chr
        end
        newArr.push(newStr)
    end
    return newArr
end

puts random_string