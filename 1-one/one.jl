# Michael Peters
# Advent of Code: Day 1
# Language: Julia

f = open("one.txt", "r")
nums = []

while !eof(f)
    num = readline(f)
    append!(nums, [parse(Int64, num)])
end
close(f)    

function partOne(nums)
    for i in nums
        for j in nums
            if i + j == 2020
                println("i: $i, j: $j, product $(i * j)")
                return(i * j)
            end
        end
    end
end

function partTwo(nums)
    for i in nums
        for j in nums
            for k in nums
                if i + j + k == 2020
                    println("i: $i, j: $j, k:, $k, product $(i * j * k)")
                    return(i * j * k)
                end
            end
        end
    end
end
                    
partOne(nums)
partTwo(nums)